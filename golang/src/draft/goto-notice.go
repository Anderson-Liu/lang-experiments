package main

func test() {
test:
	println("test")
	println("test exit.")
}

func main() {
	//start: unused label error

	for i := 0; i < 3; i++ {
	loop:
		println(i)

		if i > 1 {
			goto exit
		}
	}
exit:
	println("exit.")

	goto test // undefined
	goto loop // undefined
}
