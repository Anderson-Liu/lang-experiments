package main

import "runtime/debug"

func test(x, y int) {
	z := 0

	func() {
		defer func() {
			if err:=recover(); err != nil {
				z = 0
				debug.PrintStack()
			}
		}()
		z = x / y
	}()

	println("x/y=", z)
}

func main() {
	test(5, 0)
}
