# Sequensual

Sequensual is a step sequencer written in Go.

## Ready...

To run this project you will need to have installed [Go](https://golang.org/doc/install) and [Wails](https://github.com/wailsapp/wails).

Install the dependencies: In `/sequensual` run `make deps`.

## Go.

To build the binary, run `make build`.

To run the dev server, run `make wailsserve` and `make nodeserv`.

### Sushi

This repo includes a dir containing [Sushi](https://github.com/elk-audio/sushi) by Elk Audio, along with an example config. This is useful for testing the sequencer, as it can receive data via gRPC, OSC or MIDI.

* Copy `example/mda-vst3.vst3` to home dir (or root if you are logged in as root)
* run `make runappimage`

To do: Test with the v0.11 AppImage. Currently not working as expected in Ubuntu Studio 20.04