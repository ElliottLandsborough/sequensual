package main

import (
	"fmt"
)

// Sequencer describes the mechanism that
// Triggers and synchronizses a Pattern for audio playback.
type Sequencer struct {
	Timer *Timer
	Beat  int
	Channel int32
	Steps *map[int]*Step
	Length int
}

type Step struct {
	Number int
	Active bool
	Trig *Trigger
}

type Trigger struct {
	Note int32
	Velocity float32
	Length int
}

// NewSequencer creates and returns a pointer to a New Sequencer.
// Returns an error if there is one encountered
// During initializing portaudio, or the default stream
func NewSequencer(length int, tempo float32) (*Sequencer, error) {

	fmt.Println("new seq")

	s := &Sequencer{
		Timer: NewTimer(tempo),
		Beat:  0,
		Channel: 0,
		Steps: MakeSteps(length),
		Length: length,
	}

	return s, nil
}

// MakeSteps creates and returns a map of key value pairs, 
// containing integer keys, one for each step, and a pointers to steps
func MakeSteps(length int) (*map[int]*Step) {
	stps := make(map[int]*Step, length)

	for i := 0; i < length; i++ {
		stps[i] = &Step{}
	}

	return &stps
}

// Start starts the sequencer.
// Starts counting the Pulses Per Quarter note for the given BPM.
// Triggers samples based on each 16th note that is triggered.
func (s *Sequencer) Start() {
	go func() {
		ppqnCount := 0

		for {
			select {
			case <-s.Timer.Pulses:
				ppqnCount++

				// Trigger playback after 6 pulses, which is 16th note precision
				// TODO add in time signatures
				if ppqnCount%(int(Ppqn)/4) == 0 {
					go s.PlayTrigger()

					s.Beat++
				}

				// Reset the ppqn Count and Beat count after 4 bars of quarter notes
				// TODO add in different kinds of time signatures
				if ppqnCount == (int(Ppqn) * 4) {
					ppqnCount = 0
					s.Beat = 0
				}

			}
		}
	}()

	// loop
	go s.Timer.Start()
}

// ProcessAudio is the callback function for the portaudio stream
// Attached the the current Sequencer.
// Writes all active Track Samples to the output buffer
// At the playhead for each track.
func (s *Sequencer) ProcessAudio(out []float32) {
	for i := range out {
		var data float32

		if data > 1.0 {
			data = 1.0
		}

		out[i] = data
	}
}

// PlayTrigger triggers a playback for any track that is active for the passed in index.
// Triggers a playback by resetting the playhead for the matching tracks.
func (s *Sequencer) PlayTrigger() {
	fmt.Printf("woof")
	control()
	return
}
