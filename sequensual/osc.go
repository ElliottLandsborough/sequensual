package main

import (
	"fmt"
	"time"

	"github.com/hypebeast/go-osc/osc"
)

func oscControl() {
	client := osc.NewClient("localhost", 24024)
	noteOn := osc.NewMessage("/keyboard_event/main", string("note_on"), int32(0), int32(50), float32(1))
	noteOff := osc.NewMessage("/keyboard_event/main", string("note_off"), int32(0), int32(50), float32(1))
	client.Send(noteOn)
	fmt.Println(noteOn)
	time.Sleep(time.Second)
	client.Send(noteOff)
}