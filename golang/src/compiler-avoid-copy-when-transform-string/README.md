# 使用GDB、LLDB和Delve调试验证

编译器会为某些场合进行专门优化，避免额外分配和复制操作：   

- 将[]byte转换为string key，去map[string]查询的时候。   
- 将string转换为[]byte，进行for range迭代时，直接取字节赋值给局部变量。

```
➜  compiler-avoid-copy-when-transform-string git:(master) ✗ go build -gcflags "-N -l" example.go 
```

## GDB go1.7.6  验证成功

```
➜  compiler-avoid-copy-when-transform-string git:(master) ✗ gdb example
GNU gdb (GDB) 8.0.1
Copyright (C) 2017 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-apple-darwin17.0.0".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from example...done.
(gdb) b 9
Breakpoint 1 at 0x2164: file /Users/anderson/Code/lang-experiments/golang/src/compiler-avoid-copy-when-transform-string/example.go, line 9.
(gdb) c
The program is not being run.
(gdb) r
Starting program: /Users/anderson/Code/lang-experiments/golang/src/compiler-avoid-copy-when-transform-string/example 
[New Thread 0x2703 of process 90436]
warning: unhandled dyld version (15)
[New Thread 0x1907 of process 90436]
[New Thread 0x1a03 of process 90436]
[New Thread 0x2503 of process 90436]
[New Thread 0x2603 of process 90436]

Thread 2 hit Breakpoint 1, main.main ()
    at /Users/anderson/Code/lang-experiments/golang/src/compiler-avoid-copy-when-transform-string/example.go:9
9		x, ok := m[string(key)]
(gdb) p key
$1 = {array = 0xc420047ee0 "abc", len = 3, cap = 32}
(gdb) b runtime.mapaccess2_faststr
Breakpoint 2 at 0x94b0: file /Users/anderson/.gvm/gos/go1.7.6/src/runtime/hashmap_fast.go, line 297.
(gdb) c
Continuing.

Thread 2 hit Breakpoint 2, runtime.mapaccess2_faststr (t=0x5a2c0 <type.*+50144>, h=0xc42007c000, ky=..., ~r3=0x3, ~r4=32)
    at /Users/anderson/.gvm/gos/go1.7.6/src/runtime/hashmap_fast.go:297
297	func mapaccess2_faststr(t *maptype, h *hmap, ky string) (unsafe.Pointer, bool) {
(gdb) p ky
$2 = 0xc420047ee0 "abc"
``` 

## delve go1.7.6  验证失败

```
➜  compiler-avoid-copy-when-transform-string git:(master) ✗ dlv exec example
Type 'help' for list of commands.
(dlv) b example.go:9
Breakpoint 1 set at 0x2164 for main.main() ./example.go:9
(dlv) c
> main.main() ./example.go:9 (hits goroutine(1):1 total:1) (PC: 0x2164)
     4:		m := map[string]int {
     5:			"abc" : 123,
     6:		}
     7:	
     8:		key := []byte("abc")
=>   9:		x, ok := m[string(key)]
    10:	
    11:		println(x, ok)
    12:	}
(dlv) p key
[]uint8 len: 3, cap: 32, [97,98,99]
(dlv) p &key
(*[]uint8)(0xc420047f20)                                # 地址是0xc420047f20
(dlv) b runtime.mapaccess2_faststr
Breakpoint 2 set at 0x94c3 for runtime.mapaccess2_faststr() /Users/anderson/.gvm/gos/go1.7.6/src/runtime/hashmap_fast.go:297
(dlv) c
> runtime.mapaccess2_faststr() /Users/anderson/.gvm/gos/go1.7.6/src/runtime/hashmap_fast.go:297 (hits goroutine(1):1 total:1) (PC: 0x94c3)
   292:				return unsafe.Pointer(&zeroVal[0])
   293:			}
   294:		}
   295:	}
   296:	
=> 297:	func mapaccess2_faststr(t *maptype, h *hmap, ky string) (unsafe.Pointer, bool) {
   298:		if raceenabled && h != nil {
   299:			callerpc := getcallerpc(unsafe.Pointer(&t))
   300:			racereadpc(unsafe.Pointer(h), callerpc, funcPC(mapaccess2_faststr))
   301:		}
   302:		if h == nil || h.count == 0 {
(dlv) p &ky
(*string)(0xc420047ea8)                               # 地址是0xc420047ea8
```

## LLDB go1.7.6  验证成功

``` 
➜  compiler-avoid-copy-when-transform-string git:(master) ✗ lldb example
(lldb) target create "example"
Current executable set to 'example' (x86_64).
(lldb) b example.go:9
Breakpoint 1: where = example`main.main + 292 at example.go:9, address = 0x0000000000002164
(lldb) r
Process 91197 launched: '/Users/anderson/Code/lang-experiments/golang/src/compiler-avoid-copy-when-transform-string/example' (x86_64)
Process 91197 stopped
* thread #1, stop reason = breakpoint 1.1
    frame #0: 0x0000000000002164 example`main.main at example.go:9
   6   		}
   7   	
   8   		key := []byte("abc")
-> 9   		x, ok := m[string(key)]
   10  	
   11  		println(x, ok)
   12  	}
Target 0: (example) stopped.
(lldb) p key
([]uint8) key = (len 3, cap 32) {
  [0] = 97
  [1] = 98
  [2] = 99
}
(lldb) p &key
(*[]uint8)  = 0x000000c420041ee0 (len 0, cap 0)
(lldb) b runtime.mapaccess2_faststr
Breakpoint 2: where = example`runtime.mapaccess2_faststr + 33 at hashmap_fast.go:302, address = 0x00000000000094d1
(lldb) p key
([]uint8) key = (len 3, cap 32) {
  [0] = 97
  [1] = 98
  [2] = 99
}
(lldb) c
Process 91197 resuming
Process 91197 stopped
* thread #1, stop reason = breakpoint 2.1
    frame #0: 0x00000000000094d1 example`runtime.mapaccess2_faststr(t=0x000000000005a2c0, h=0x000000c420076000, ky="abc", ~r3=0x0000000000000003, ~r4=true) at hashmap_fast.go:302
   299 			callerpc := getcallerpc(unsafe.Pointer(&t))
   300 			racereadpc(unsafe.Pointer(h), callerpc, funcPC(mapaccess2_faststr))
   301 		}
-> 302 		if h == nil || h.count == 0 {
   303 			return unsafe.Pointer(&zeroVal[0]), false
   304 		}
   305 		if h.flags&hashWriting != 0 {
Target 0: (example) stopped.
(lldb) p ky
(string) ky = "abc"
(lldb) p &ky
(*string)  = 0x000000c420041ee0 ""
```

---

## GDB go1.10  无法查看数组地址，无法验证
```
➜  compiler-avoid-copy-when-transform-string git:(master) ✗ gdb example_1_10 
GNU gdb (GDB) 8.0.1
Copyright (C) 2017 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-apple-darwin17.0.0".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from example_1_10...done.
Loading Go Runtime support.
(gdb) b 9
Breakpoint 1 at 0x104d4b4: file /Users/anderson/Code/lang-experiments/golang/src/compiler-avoid-copy-when-transform-string/example.go, line 9.
(gdb) r
Starting program: /Users/anderson/Code/lang-experiments/golang/src/compiler-avoid-copy-when-transform-string/example_1_10 
[New Thread 0x1903 of process 92053]
warning: unhandled dyld version (15)
[New Thread 0x1807 of process 92053]
[New Thread 0x1a03 of process 92053]
[New Thread 0x2503 of process 92053]
[New Thread 0x2603 of process 92053]

Thread 2 hit Breakpoint 1, main.main () at /Users/anderson/Code/lang-experiments/golang/src/compiler-avoid-copy-when-transform-string/example.go:9
9		x, ok := m[string(key)]
(gdb) p key
$1 =  []uint8 = {97 'a', 98 'b', 99 'c'}
(gdb) p &key
$2 =  []uint8 * = {97 'a', 98 'b', 99 'c'}
(gdb) b runtime.mapaccess2_faststr
Breakpoint 2 at 0x1007ee0: file /usr/local/Cellar/go/1.10/libexec/src/runtime/hashmap_fast.go, line 261.
(gdb) c
Continuing.

Thread 2 hit Breakpoint 2, runtime.mapaccess2_faststr (h=0xc420057e78, ky="abc", t=0x105ad60 <type.*+55168>, ~r3=0x3, ~r4=32)
    at /usr/local/Cellar/go/1.10/libexec/src/runtime/hashmap_fast.go:261
261	func mapaccess2_faststr(t *maptype, h *hmap, ky string) (unsafe.Pointer, bool) {
(gdb) p ky
$3 = "abc"
(gdb) p &ky
$4 = "abc"
```

## delve go1.10  验证失败
```
➜  compiler-avoid-copy-when-transform-string git:(master) ✗ dlv exec example_1_10
Type 'help' for list of commands.
(dlv) b example.go:9
Breakpoint 1 set at 0x104d4b4 for main.main() ./example.go:9
(dlv) c
> main.main() ./example.go:9 (hits goroutine(1):1 total:1) (PC: 0x104d4b4)
     4:		m := map[string]int {
     5:			"abc" : 123,
     6:		}
     7:	
     8:		key := []byte("abc")
=>   9:		x, ok := m[string(key)]
    10:	
    11:		println(x, ok)
    12:	}
(dlv) p key
[]uint8 len: 3, cap: 32, [97,98,99]
(dlv) p &key
(*[]uint8)(0xc420057e60)
(dlv) b runtime.mapaccess2_faststr
Breakpoint 2 set at 0x1007ef3 for runtime.mapaccess2_faststr() /usr/local/Cellar/go/1.10/libexec/src/runtime/hashmap_fast.go:261
(dlv) c
> runtime.mapaccess2_faststr() /usr/local/Cellar/go/1.10/libexec/src/runtime/hashmap_fast.go:261 (hits goroutine(1):1 total:1) (PC: 0x1007ef3)
Warning: debugging optimized function
   256:			}
   257:		}
   258:		return unsafe.Pointer(&zeroVal[0])
   259:	}
   260:	
=> 261:	func mapaccess2_faststr(t *maptype, h *hmap, ky string) (unsafe.Pointer, bool) {
   262:		if raceenabled && h != nil {
   263:			callerpc := getcallerpc()
   264:			racereadpc(unsafe.Pointer(h), callerpc, funcPC(mapaccess2_faststr))
   265:		}
   266:		if h == nil || h.count == 0 {
(dlv) p ky
"abc"
(dlv) p &ky
(*string)(0xc420057dd0)
```

## LLDB go1.10  验证成功
```
➜  compiler-avoid-copy-when-transform-string git:(master) ✗ lldb example_1_10 
(lldb) target create "example_1_10"
Current executable set to 'example_1_10' (x86_64).
(lldb) b example.go:9
Breakpoint 1: where = example_1_10`main.main + 372 at example.go:9, address = 0x000000000104d4b4
(lldb) r
Process 91907 launched: '/Users/anderson/Code/lang-experiments/golang/src/compiler-avoid-copy-when-transform-string/example_1_10' (x86_64)
Process 91907 stopped
* thread #1, stop reason = breakpoint 1.1
    frame #0: 0x000000000104d4b4 example_1_10`main.main at example.go:9
   6   		}
   7   	
   8   		key := []byte("abc")
-> 9   		x, ok := m[string(key)]
   10  	
   11  		println(x, ok)
   12  	}
Target 0: (example_1_10) stopped.
(lldb) p key
([]uint8) key = (len 3, cap 32) {
  [0] = 97
  [1] = 98
  [2] = 99
}
(lldb) p &key
(*[]uint8)  = 0x000000c420057e10 (len 0, cap 0)
(lldb) b runtime.mapaccess2_faststr
Breakpoint 2: where = example_1_10`runtime.mapaccess2_faststr + 38 at hashmap_fast.go:266, address = 0x0000000001007f06
(lldb) c
Process 91907 resuming
Process 91907 stopped
* thread #1, stop reason = breakpoint 2.1
    frame #0: 0x0000000001007f06 example_1_10`runtime.mapaccess2_faststr(h=0x000000c420057e78, ky="abc", t=0x000000000105ad60, ~r3=0x0000000000000003, ~r4=true) at hashmap_fast.go:266
   263 			callerpc := getcallerpc()
   264 			racereadpc(unsafe.Pointer(h), callerpc, funcPC(mapaccess2_faststr))
   265 		}
-> 266 		if h == nil || h.count == 0 {
   267 			return unsafe.Pointer(&zeroVal[0]), false
   268 		}
   269 		if h.flags&hashWriting != 0 {
Target 0: (example_1_10) stopped.

(lldb) p ky
(string) ky = "abc"
(lldb) p &ky
(*string)  = 0x000000c420057e10 ""
(lldb) 
```

## 结论

- 不知道为什么，切换版本前后delve都验证失败了
- 切换版本前后，LLDB都验证成功了
- GDB无法查看GO1.10的数组地址