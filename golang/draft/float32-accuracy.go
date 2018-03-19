package main

import "fmt"

func main() {
	var a float32 = 1.1234567899 // 默认浮点类型是float64
	var b float32 = 1.12345678
	var c float32 = 1.123456781

	println(a, b, c)
	// a b c 相等
	println(a == b, a == c)
	fmt.Printf("%v %v, %v\n", a, b, c)
}
