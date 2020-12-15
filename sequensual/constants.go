package main

// Ppqn - Pulses Per Quarter Note.  A synchronization primative used in music technology.
var Ppqn = 24.0

// Minute - The number of seconds in a Minute as a float.
var Minute = 60.0

// Microsecond - The number of microseconds in a Second.
var Microsecond = 1000000000

// DefaultTempo - The Default BPM of the step sequencer
var DefaultTempo float32 = 120.0

// SampleRate - The standard audio sampling rate of 48kHz (48000)
var SampleRate = 48000

// InputChannels - The number of portaudio input channels.  This value is set to 0 since we're reading from disk.
var InputChannels = 0

// OutputChannels - The number of portaudio output channels.
var OutputChannels = 2
