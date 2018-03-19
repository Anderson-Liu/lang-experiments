package main

// 配合标签、break和continue可在多层嵌套中指定目标层级
func main() {
outer:
	for x := 0; x < 5; x++ {
		for y := 0; y < 10; y++ {
			if y > 2 {
				println("Do continue outer")
				continue outer
			}
			if x > 2 {
				println("Do break outer")
				break outer
			}
			println(x, ":", y, " ")
		}
	}
}
