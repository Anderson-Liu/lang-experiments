package main

var x = 100

func main() {
	println(&x, x)

	x := "abc"

	println(&x, x)
}
