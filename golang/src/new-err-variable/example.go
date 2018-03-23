package main

/*
	应通过错误变量，而非文本内容来判定错误类别。
	错误变量通常以err作为前缀，且字符串内容全部小写，没有结束标点，
	以便于嵌入到其他格式化字符串中输出。全局错误变量并非没有问题，
	因为它们可被用户重新赋值，这就可能导致结果不匹配。不知道以后是
	否会出现只读变量功能，否则就只能依靠自觉了。
 */

import (
	"errors"
	"log"
)

var errDivByZero = errors.New("division by zero")

func div(x, y int) (int, error) {
	if y == 0 {
		return 0, errDivByZero
	}
	return x/y, nil
}

func main() {
	z, err := div(5, 0)
	if err == errDivByZero {
		log.Fatalln(err)
	}
	println(z)
}
