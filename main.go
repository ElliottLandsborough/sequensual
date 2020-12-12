package main

import (
	"fmt"
	"os"
	"time"
)

func main() {
	fmt.Printf("Starting...\n")

	if len(os.Args[1:]) > 0 {

		arg := os.Args[1]

		switch arg {
		case "control":
			control()
		case "oldMain":
			oldMain()
		default:
			fmt.Printf("Please choose a command.\n")
		}
	}

	fmt.Printf("Finished.\n")
}

func oldMain() {
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
