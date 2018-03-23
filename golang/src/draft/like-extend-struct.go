package main

import "fmt"

type user struct {
	name string
	age  byte
}

func (u user) ToString() string {
	return fmt.Sprintf("%+v", u)
}

type manager struct {
	user
	title string
}

func main() {
	var m manager
	m.name = "Tom"
	m.age = 29
	// 调用匿名字段的方法，实现与继承类似的功能
	println(m.ToString())
}
