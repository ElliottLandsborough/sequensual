package main

import (
	"fmt"
	"time"

	"github.com/hypebeast/go-osc/osc"
	"github.com/leaanthony/mewn"
	"github.com/wailsapp/wails"
)

func control() string {
	client := osc.NewClient("localhost", 24024)
	noteOn := osc.NewMessage("/keyboard_event/main", string("note_on"), int32(0), int32(50), float32(1))
	noteOff := osc.NewMessage("/keyboard_event/main", string("note_off"), int32(0), int32(50), float32(1))
	client.Send(noteOn)
	fmt.Println(noteOn)
	time.Sleep(time.Second)
	client.Send(noteOff)
	return "lol"
}

func main() {
	//wailsApp()
	s, err := NewSequencer(16, 140.0)
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	s.Start()
}

func wailsApp() {

	js := mewn.String("./frontend/dist/app.js")
	css := mewn.String("./frontend/dist/app.css")

	app := wails.CreateApp(&wails.AppConfig{
		Width:  1024,
		Height: 768,
		Title:  "Sequensual",
		JS:     js,
		CSS:    css,
		Colour: "#131313",
	})

	// app bindings
	app.Bind(control)


	app.Run()
}