package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Printf("%s\n", "lol")

	// sleep until cleverness
	time.Sleep(24 * 60 * 60 * time.Second)

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
