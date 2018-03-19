package main

/*
	多个匿名函数引用同一环境变量，也会让事情变得更加复杂。
	任何的修改行为都会影响其他函数取值，在并发模式下可能需要做同步处理。
*/

func test(x int) (func(), func()) {
	return func() {
		println(x)
		x += 10
	}, func() {
		println(x)
	}
}

func main() {
	a, b := test(100)
	a()
	b()
}