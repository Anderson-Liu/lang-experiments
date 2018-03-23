package main

import "log"

func catch() {
	log.Println("catch: ", recover())
}

func foo() {
	println("foo")
}

func main() {
	defer foo()							// will be call even though already recover
	defer catch()						// recover success
	defer log.Println(recover())		// recover fail
	defer recover()						// recover fail

	panic("I am dead")
}