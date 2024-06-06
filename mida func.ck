// Sine Wave
SinOsc s => dac;
440 => s.freq;
1::second => now;

// Square Wave
PulseOsc sq => dac;
220 => sq.freq;
0.5 => sq.width; // Set width to 50% for a square wave
1::second => now;

// Sawtooth Wave
SawOsc sa => dac;
330 => sa.freq;
1::second => now;

// Triangle Wave
TriOsc t => dac;
550 => t.freq;
1::second => now;
