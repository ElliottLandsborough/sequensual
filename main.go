package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Printf("%s\n", "lol")

	s, err := NewSequencer()
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	s.Start()

	for {
		time.Sleep(time.Second)
	}
}