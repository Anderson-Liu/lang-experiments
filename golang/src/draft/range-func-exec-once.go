package main

func data() []int {
	println("origin data")
	return []int{10, 30, 20}
}

func main() {
	// execute data once
	for i, x := range data() {
		println(i, x)
	}
}
