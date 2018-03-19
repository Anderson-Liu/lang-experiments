package main
/*
test 返回的匿名函数会引用上下文环境变量。当该函数在main中执行时，
它依然可正确读取x的值，这种现象就称作闭包。
							——《Go语言学习笔记》4.4
 */

func test(x int) func() {
	println(&x)

	return func() {
		println(&x, x)
	}
}

func main() {
	f := test(0x100)
	f()
}
