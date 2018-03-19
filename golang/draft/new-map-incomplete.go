package main

import "fmt"

func main() {
	p := new(map[string]int)
	m := *p
	m["a"] = 1
	fmt.Println(m)
}
