package main

import "fmt"

// range 会复制目标数据。受直接影响的是数组，可改用数组指针或切片类型
func main() {
	data := [3]int{10, 20, 30}

	for i,x := range data {				// 从data复制品中取值
		if i == 0 {
			data[0] += 100
			data[1] += 200
			data[2] += 300
		}
		fmt.Printf("x: %d, data: %d\n", x, data[i])
	}

	/*
		output:
			x: 10, data: 110
			x: 20, data: 220
			x: 30, data: 330
	 */

	for i,x := range data[:] {			// 仅复制slice，不包括底层array
		if i == 0 {
			data[0] += 100
			data[1] += 200
			data[2] += 300
		}
		fmt.Printf("x: %d, data: %d\n", x, data[i])
	}
	/*
		output:
			x: 110, data: 210
			x: 420, data: 420
			x: 630, data: 630
	 */
}
