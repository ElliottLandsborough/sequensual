package main

import (
	"fmt"
	"github.com/leaanthony/mewn"
	"github.com/wailsapp/wails"
)

func main() {

	s, err := NewSequencer(16, 0, 140.0)
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	wailsInit(s)
}

func wailsInit(s *Sequencer) {

	js := mewn.String("./frontend/dist/app.js")
	css := mewn.String("./frontend/dist/app.css")

	app := wails.CreateApp(&wails.AppConfig{
		Width:  1280,
		Height: 940,
		Title:  "Sequensual",
		JS:     js,
		CSS:    css,
		Colour: "#131313",
	})

	// app bindings
	app.Bind(s)

	app.Run()
}