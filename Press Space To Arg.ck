// Open the HID device
Hid hi;
HidMsg msg;
if (!hi.openKeyboard()) me.exit();

// Create a sine wave oscillator
SinOsc osc => dac;
0.5 => osc.gain;

// MIDI note to frequency function
fun float mtof(int midi) {
    return 440.0 * Math.pow(2, (midi - 69) / 12.0);
}

while (true) {
    hi => now;
    while (hi.recv(msg)) {
        if (msg.isKeyDown()) {
            <<< "Key down:", msg.which >>>;
            mtof(msg.which) => osc.freq;
        } else if (msg.isKeyUp()) {
            <<< "Key up:", msg.which >>>;
            0 => osc.freq; // Stop the sound when key is released
        }
    }
}
