package main

func main() {
	var s string

	println(s == "")
	// invalid operation: s == nil (mismatched types string and nil)
	println(s == nil)
}
