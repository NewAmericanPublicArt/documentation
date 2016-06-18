Code repository on Github: [Blue Hour Baltimore](https://github.com/NewAmericanPublicArt/blue-hour-baltimore)

# Easing transitions between colors #

Just for reference, here is the easing function I wrote for the Teensy.

```C++
float easing(int mode, int cube_index, float ms_since_trigger) {
    float b = frame_snapshot[cube_index];
    float c = targets[cube_index] - frame_snapshot[cube_index];
    float d = CUBIC_EASING_DURATION_IN_MS;
    float t = 0;
    float easing = 0;
    if(mode == CUBIC) {
        t = (ms_since_trigger/d) - 1; // scale time from [0-duration] to [-1 to 0]
        easing = c*t*t*t + c + b;
        return easing;
    } else {
        Serial.println("Easing mode not set right.\n");
        return 0.0;
    }
}
```
Easing equations for color transitions: [Easing equations](http://www.gizma.com/easing/)

# Making main loop execute at a fixed frequency #

```C++
void loop() {
    unsigned long loop_thus_far;
    signed long loop_remaining;
    static unsigned long looptimer;
    looptimer = millis(); // mark the beginning of the loop
    /* See how long this loop has taken so far, and then delay so that we hit LOOP_PERIOD correctly. */
    loop_thus_far = millis() - looptimer;
    loop_remaining = LOOP_PERIOD - loop_thus_far;
    if(loop_remaining > 0) {
        delay(loop_remaining);
    } else {
        Serial.println("Loop blown!");
    }
}
```

<img src="../img/interaction-planning.jpg" width="750">

# Color timeline #

To implement the color gradients that the cubes traverse when people trigger Blue Hour's sensors, Dan made an image in Photoshop that showed the gradients. I then wrote the Python script below that samples the colors from the image file and writes a C header file that contains the color data as 3 large C arrays (one array each for red, green, and blue).

The final color gradient that we used:

<img src="../img/final-color-gradient.png" width="750">


```Python
from PIL import Image
im = Image.open("ColorGrad.png")
(width, height) = im.size
pixels = [im.getpixel((x, 25)) for x in range(width)] # grab 3500 pixels from 7000 pixel image

reds = ["0"] * 4000 + [str(p[0]) for p in pixels] + ["255"] * 3250
greens = ["0"] * 4000 + [str(p[1]) for p in pixels] + ["0"] * 3250
blues = ["255"] * 4000 + [str(p[2]) for p in pixels] + ["0"] * 3250

trail_length = len(blues)
print(trail_length)

with open('blue-hour-baltimore/blue-hour-color-trails.h', 'w') as f:
    f.write("#define TOTAL_FRAMES %s\n\nbyte red_trail[TOTAL_FRAMES] = {%s};\nbyte green_trail[TOTAL_FRAMES] = {%s};\nbyte blue_trail[TOTAL_FRAMES] = {%s};"
        % (trail_length, ",".join(reds), ",".join(greens), ",".join(blues)))
```

<img src="../img/color-timeline-plan.jpg" width="750">
