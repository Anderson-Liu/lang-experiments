package main

/*
	自定义错误类型通常以Error为名称后缀。在用switch按类型匹配时，
	注意case顺序。应将自定义类型放在前面，优先匹配更具体的错误类型。
 */
import (
	"fmt"
	"log"
)

type DivError struct {
	x, y int
}

func (DivError) Error() string {
	return "division by zero"
}

func div(x, y int) (int, error) {
	if y == 0 {
		return 0, DivError{x, y}
	}
	return x / y, nil
}

func main() {
	z, err := div(5, 0)

	if err != nil {
		switch e := err.(type) {
		case DivError:
			fmt.Println(e, e.x, e.y)
		default:
			fmt.Println(e)
		}
		log.Fatalln(err)
	}

	println(z)

}
