# Prototype #

The first prototype electronics reached marginal functionality on April 7, 2016. It consists of 3 Teensy 3.2's plugged into Adafruit Perma-proto boards, screwed to a piece of plywood.

The basic operation is this:

* The sensor board reads the ultrasonic sensor and two PIR sensors. When any of those three sensors is triggered, a corresponding digital output pin is set high.

* The audio board watches those three pins. The PIR sensors aren't hooked up yet, so the audio board just plays ambient music. When the sensor board signals that the ultrasonic sensor is triggered, the audio board lowers the volume on the ambient music and plays a short audio sample. When the sample ends, it turns the audio back up, unless the sensor is still being tripped, in which case it repeats the sample.

* The logging board will log changes in the state of the sensor pins. It's wired up, but has no code on it yet.

* The sensor board with also send out DMX signals. It has a DMX transceiver attached, but no code to send DMX yet.

* The system currently runs off an external 5 V supply. This external supply might end up being inside the electronics enclosure.

* The music just comes out a small battery-powered speaker. In the final system, we'll add an audio amplifier inside the enclosure and some external speakers.

* So far, the ultrasonic sensors is responsive, but it has an annoying tendency to get stuck at close readings. Not sure what's going on with that.

<img src="/ourself/img/ourself-prototype-iso-2016-04-07.jpg" width="750">

<img src="/ourself/img/ourself-prototype-top-2016-04-07.jpg" width="750">

<img src="/ourself/img/ourself-prototype-front-2016-04-07.jpg" width="750">

# Final electronics #

<img src="/ourself/img/ourself-teensy-with-rainbow-wires-2016-05-07.jpg" width="750">

<img src="/ourself/img/ourself-two-sets-of-electronics-2016-05-11.jpg" width="750">

<img src="/ourself/img/ourself-brain-boxes-2016-05-09.jpg" width="750">

<img src="/ourself/img/ourself-enclosure-holes-drawing-2016-05-07.jpg" width="750">

<img src="/ourself/img/ourself-whiteboard-wiring-2016-05-11.jpg" width="750">
