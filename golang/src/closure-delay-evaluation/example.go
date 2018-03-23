package main
/*
	闭包返回的函数不执行，引用的值是指针，因此最后
	读取的时候会发现各个引用都是计算的最终值
	要解决这个问题，办法就是各自引用不同的指针存储值
 */

func delay() []func() {
	var s []func()

	for i := 0; i < 2; i++ {
		s = append(s, func() {
			println(&i, i)
		})
	}
	return s
}

func noDelay() []func() {
	var s[]func()

	for i := 0; i < 2; i++ {
		// x每次循环都重新定义
		x := i
		s = append(s, func() {
			println(&x, x)
		})
	}

	return s
}

func main() {
	for _, f := range delay() {
		f()
	}

	for _, f := range noDelay() {
		f()
	}
}
