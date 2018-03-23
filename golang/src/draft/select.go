package main

import "fmt"

func fibonacci(c, quit chan int) {
	x, y := 0, 1
	// continue send new value to c
	// once check value exist in quit, random excute quit or fibonacci
	for {
		select {
		case c <- x:
			x, y = y, x+y
		case <-quit:
			fmt.Println("quit")
			return
		}
	}
}

func main() {
	c := make(chan int)
	quit := make(chan int)
	go func() {
		for i := 0; i < 10; i++ {
			// continue get 10 value from c
			fmt.Println(<-c)
		}
		// send 0 to quit
		quit <- 0
	}()
	fibonacci(c, quit)
}
