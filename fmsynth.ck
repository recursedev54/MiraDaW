// Carrier and modulator
SinOsc carrier => dac;
SinOsc modulator => blackhole;

// Set frequencies
440 => carrier.freq;
110 => modulator.freq;

// Set modulation index
100 => float modulationIndex;

while (true) {
    modulator.last() * modulationIndex + carrier.freq() => carrier.freq;
    1::samp => now;
}
