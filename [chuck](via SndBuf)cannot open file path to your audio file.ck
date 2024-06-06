// Sound buffer
SndBuf buffer => dac;
"path/to/your/audiofile.wav" => buffer.read;

// Set grain size and overlap
100::ms => dur grainSize;
50::ms => dur overlap;

// Play the buffer in grains
while (true) {
    buffer.pos(0); // Restart buffer
    buffer.gain(0.5);
    grainSize => now;
    (grainSize - overlap) => now;
}
