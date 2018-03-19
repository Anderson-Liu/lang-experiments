package main

import "fmt"

func main() {
	const (
		x uint16 = 120
		y					// 与上一行x类型、右值相同
		s = "abc"
		z					// 与s类型、右值相同
	)

	fmt.Printf("%T, %v\n", y, y)	// 输出类型和值
	fmt.Printf("%T, %v\n", z, z)
}
