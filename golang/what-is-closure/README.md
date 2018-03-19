# GDB Experiment

分析汇编代码，你会看到返回的不仅仅是匿名函数，还包括所引用的环境
变量指针。所以说，闭包是函数和引用环境的组合体更加确切。

本质上返回的是一个funcval结构，可在runtime/run-time2.go中找到相关定义。

```
go build -gcflags "-N -l"   # 禁用内联和代码优化 
```

```
➜  what-is-closure git:(master) ✗ gdb what-is-closure
GNU gdb (GDB) 8.0.1
...
Reading symbols from what-is-closure...done.
Loading Go Runtime support.
(gdb) l
2	/*
3	test 返回的匿名函数会引用上下文环境变量。当该函数在main中执行时，
4	它依然可正确读取x的值，这种现象就称作闭包。
5								——《Go语言学习笔记》4.4
6	 */
7	
8	func test(x int) func() {
9		println(&x)
10	
11		return func() {
(gdb) l
12			println(&x, x)
13		}
14	}
15	
16	func main() {
17		f := test(0x100)
18		f()
19	}
(gdb) b 11                  # set break point
(gdb) b 18
(gdb) r                     
...
Thread 2 hit Breakpoint 1, main.test (x=256, ~r1={void (void)} 0xc420057f68) at /Users/anderson/Code/lang-experiments/golang/what-is-closure/example.go:11
11		return func() {
(gdb) info locals           # 进入test函数，查看本地变量
&x = 0xc4200140d0
(gdb) c                     # 继续执行回到main函数
Continuing.

Thread 2 hit Breakpoint 2, main.main () at /Users/anderson/Code/lang-experiments/golang/what-is-closure/example.go:18
18		f()
(gdb) disas
Dump of assembler code for function main.main:
   0x000000000104c400 <+0>:	mov    %gs:0x8a0,%rcx
   0x000000000104c409 <+9>:	cmp    0x10(%rcx),%rsp
   0x000000000104c40d <+13>:	jbe    0x104c443 <main.main+67>
   0x000000000104c40f <+15>:	sub    $0x20,%rsp
   0x000000000104c413 <+19>:	mov    %rbp,0x18(%rsp)
   0x000000000104c418 <+24>:	lea    0x18(%rsp),%rbp
   0x000000000104c41d <+29>:	movq   $0x100,(%rsp)
   0x000000000104c425 <+37>:	callq  0x104c310 <main.test>
   0x000000000104c42a <+42>:	mov    0x8(%rsp),%rdx
   0x000000000104c42f <+47>:	mov    %rdx,0x10(%rsp)
=> 0x000000000104c434 <+52>:	mov    (%rdx),%rax
   0x000000000104c437 <+55>:	callq  *%rax
   0x000000000104c439 <+57>:	mov    0x18(%rsp),%rbp
   0x000000000104c43e <+62>:	add    $0x20,%rsp
   0x000000000104c442 <+66>:	retq   
   0x000000000104c443 <+67>:	callq  0x1044a40 <runtime.morestack_noctxt>
   0x000000000104c448 <+72>:	jmp    0x104c400 <main.main>
End of assembler dump.
(gdb) x/2xg$rdx             # 包含匿名函数和环境变量地址
0xc42000e020:	0x000000000104c450	0x000000c4200140d0
(gdb) info symbol 0x000000000104c450
main.test.func1 in section .text
(gdb) s                     # step into 匿名函数

Thread 2 hit Breakpoint 1, main.test.func1 () at /Users/anderson/Code/lang-experiments/golang/what-is-closure/example.go:11
11		return func() {
(gdb) disas
Dump of assembler code for function main.test.func1:
=> 0x000000000104c450 <+0>:	mov    %gs:0x8a0,%rcx
   0x000000000104c459 <+9>:	cmp    0x10(%rcx),%rsp
   0x000000000104c45d <+13>:	jbe    0x104c4c2 <main.test.func1+114>
   0x000000000104c45f <+15>:	sub    $0x28,%rsp
   0x000000000104c463 <+19>:	mov    %rbp,0x20(%rsp)
   0x000000000104c468 <+24>:	lea    0x20(%rsp),%rbp
   0x000000000104c46d <+29>:	mov    0x8(%rdx),%rax
   0x000000000104c471 <+33>:	mov    %rax,0x18(%rsp)
   0x000000000104c476 <+38>:	mov    %rax,0x10(%rsp)
   0x000000000104c47b <+43>:	mov    0x18(%rsp),%rax
   0x000000000104c480 <+48>:	mov    (%rax),%rax
   0x000000000104c483 <+51>:	mov    %rax,0x8(%rsp)
   0x000000000104c488 <+56>:	callq  0x1022140 <runtime.printlock>
   0x000000000104c48d <+61>:	mov    0x10(%rsp),%rax
   0x000000000104c492 <+66>:	mov    %rax,(%rsp)
   0x000000000104c496 <+70>:	callq  0x1022a40 <runtime.printpointer>
   0x000000000104c49b <+75>:	callq  0x1022380 <runtime.printsp>
   0x000000000104c4a0 <+80>:	mov    0x8(%rsp),%rax
   0x000000000104c4a5 <+85>:	mov    %rax,(%rsp)
   0x000000000104c4a9 <+89>:	callq  0x10228c0 <runtime.printint>
   0x000000000104c4ae <+94>:	callq  0x10223d0 <runtime.printnl>
   0x000000000104c4b3 <+99>:	callq  0x10221c0 <runtime.printunlock>
   0x000000000104c4b8 <+104>:	mov    0x20(%rsp),%rbp
   0x000000000104c4bd <+109>:	add    $0x28,%rsp
   0x000000000104c4c1 <+113>:	retq   
   0x000000000104c4c2 <+114>:	callq  0x10449a0 <runtime.morestack>
   0x000000000104c4c7 <+119>:	jmp    0x104c450 <main.test.func1>
End of assembler dump.
(gdb) x/1xg$rdx+0x8             # 读取了x
0xc42000e028:	0x000000c4200140d0
(gdb) 
```