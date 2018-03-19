package main

import "fmt"

type user struct {
	name string
	age  byte
}

type manager struct {
	user
	title string
}

func main() {
	var m manager

	m.name = "Tom" // 直接访问匿名字段的成员
	m.age = 29
	m.title = "CTO"

	fmt.Println(m)
}
