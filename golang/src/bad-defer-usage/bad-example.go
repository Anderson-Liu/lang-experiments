package main

import (
	"fmt"
	"os"
	"log"
)

func main() {
	for i := 0; i < 10000; i++ {
		path := fmt.Sprintf("./log/%d.txt", i)

		f, err := os.Open(path)
		if err != nil {
			log.Println(err)
			continue
		}
		// Possible resource leak, 'defer' is called in a for loop
		// 这个关闭操作在main函数结束时才会执行，而不是当前循环中执行
		// 这个关闭操作在main函数结束时才会执行，而不是当前循环中执行
		defer f.Close()
	}
}

