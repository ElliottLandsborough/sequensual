package main

import (
	"fmt"
	"os"
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
	fmt.Printf("Starting...\n")

	if len(os.Args[1:]) > 0 {

		arg := os.Args[1]

		switch arg {
		case "control":
			control()
		case "oldMain":
			oldMain()
		case "wails":
			wailsApp()
		default:
			fmt.Printf("Please choose a command.\n")
		}
	}

	fmt.Printf("Finished.\n")
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
	app.Bind(control)
	app.Run()
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
