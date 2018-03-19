package main

func main() {
	data := [3]string{"a", "b", "c"}

	// for range will reuse local valve
	for i, s := range data {
		println(&i, &s)
	}
}
