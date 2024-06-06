// Bassline
SinOsc bass => dac;
0.2 => bass.gain;

// Sequence of bass notes (MIDI numbers)
[36, 38, 40, 41, 43, 45, 47, 48] @=> int bassSequence[];

// Function to play a note
fun void playBassNote (int note) {
    note => Std.mtof => bass.freq;
    500::ms => now;
}

// Loop through the bass sequence
while (true) {
    for (0 => int i; i < bassSequence.size(); i++) {
        playBassNote(bassSequence[i]);
    }
}
// Lead Melody
SawOsc lead => dac;
0.3 => lead.gain;

// Sequence of lead notes (MIDI numbers)
[60, 62, 64, 65, 67, 69, 71, 72] @=> int leadSequence[];

// Function to play a note
fun void playLeadNote (int note) {
    note => Std.mtof => lead.freq;
    250::ms => now;
}

// Loop through the lead sequence
while (true) {
    for (0 => int i; i < leadSequence.size(); i++) {
        playLeadNote(leadSequence[i]);
    }
}
// Drum Pattern
Impulse kick => dac;
Impulse snare => dac;
Impulse hiHat => dac;
0.4 => kick.gain;
0.3 => snare.gain;
0.2 => hiHat.gain;

// Drum pattern array
[1, 0, 0, 2, 0, 3, 0, 0] @=> int drumPattern[];

// Function to play drums
fun void playDrum (int drum) {
    if (drum == 1) { 1 => kick.next; }
    else if (drum == 2) { 1 => snare.next; }
    else if (drum == 3) { 1 => hiHat.next; }
}

// Loop through the drum pattern
while (true) {
    for (0 => int i; i < drumPattern.size(); i++) {
        playDrum(drumPattern[i]);
        125::ms => now;
    }
}
// Ambient Pad
TriOsc pad => JCRev reverb => dac;
0.2 => pad.gain;
0.7 => reverb.mix;

// Sequence of pad chords (MIDI numbers)
[[48, 52, 55], [50, 53, 57], [52, 55, 59], [53, 57, 60]] @=> int padSequence[][];

// Function to play a chord
fun void playPadChord (int chord[]) {
    for (0 => int i; i < chord.size(); i++) {
        chord[i] => Std.mtof => pad.freq;
        1::second => now;
    }
}

// Loop through the pad sequence
while (true) {
    for (0 => int i; i < padSequence.size(); i++) {
        playPadChord(padSequence[i]);
        2::second => now;
    }
}
