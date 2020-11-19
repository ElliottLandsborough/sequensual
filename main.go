package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Printf("%s\n", "lol")

	// sleep for a while so the machine doesn't stop itself from running
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
