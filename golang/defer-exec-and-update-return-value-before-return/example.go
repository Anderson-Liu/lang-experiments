package main

func test() (z int) {
	defer func() {
		println("defer: ", z)
		z += 100
	}()
	// return 不是ret汇编命令，它会先更新返回值
	// 实际return 200
	return 100
}

func main() {
	println("test: ", test())
}
