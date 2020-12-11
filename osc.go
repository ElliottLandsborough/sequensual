package main

import (
	"fmt"

	"github.com/hypebeast/go-osc/osc"
)

func control() {
	client := osc.NewClient("localhost", 24024)
	msg := osc.NewMessage("/keyboard_event/main", string("note_on"), int32(0), int32(50), float32(1))
	client.Send(msg)
	fmt.Println(msg)
}
