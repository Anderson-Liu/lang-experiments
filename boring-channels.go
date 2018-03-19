package main

import (
	"fmt"
	"time"
	"math/rand"
)

func main() {
	c := make(chan string)
	go boring("boring", c)
	for i:=0; i<5; i++ {
		fmt.Printf("You say %q\n", <-c)
	}
	fmt.Println("You are boring, I'm leaving.")
}

func boring(msg string, c chan string) {
	for i:=0; i<5; i++ {
		c <- fmt.Sprintf("%s %d", msg, i)
		time.Sleep(time.Duration(rand.Intn(1e3)) * time.Millisecond)
	}
}

