package main

import (
	"fmt"
	"log"
	"os"
)

func main() {
	file, err := os.Open(os.Args[1])
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()
	fmt.Println(FileSize(file))
}

func FileSize(f *os.File) int64 {
	fi, _ := f.Stat()
	fs := fi.Size()
	return fs
}
