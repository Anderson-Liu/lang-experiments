package main

func consumer(data chan int, done chan bool) {
	for x := range data {
		println("recv:", x)
	}
	done <- true
}

func producer(data chan int) {
	for i:=0; i < 4; i++ {
		data <- i
	}

	close(data)
}

func main() {
	done := make(chan bool)
	data := make(chan int)

	go consumer(data, done)
	go producer(data)

	// 阻塞，直到消费者发回结束信号
	<- done
}
