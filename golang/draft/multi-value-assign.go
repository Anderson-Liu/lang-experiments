package main

import "unsafe"

const x, y int = 123, 0x22
const s = "hello, world"
const c = '我'

const (
	i, f = 1, 0.123
	b    = false
)

func main() {
	x, y := 1, 2
	x, y = y+3, x+2
	println(x, y)
}
