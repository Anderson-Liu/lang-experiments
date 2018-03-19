package main

import (
	"fmt"
	"os"
	"log"
)

func main() {
	do := func(n int) error {
		path := fmt.Sprintf("./log/%d.txt", n)
		f, err := os.Open(path)
		if err != nil {
			log.Println(err)

		}
		defer f.Close()

	}

	for i := 0; i < 10000; i++ {
		do(i)
	}
}
