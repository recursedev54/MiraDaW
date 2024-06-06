//Specials Audition

["sinewave", "ahh", "britestk", "doh", "eee", "fwavblnk", "halfwave", "impuls10", "impuls20", "impuls40", "mand1", "mandpluk", "marmstk1", "ooo", "peksblnk", "ppksblnk", "sineblnk", "sinewave", "snglpeak", "twopeaks", "glot_ahh", "glot_eee", "glot_ooo", "glot_pop" ] @=> string specials[];

SndBuf buffs[specials.size()];
Gain g => dac;
g.gain(0.8);

5::ms => dur separator;

for ( 0 => int i; i < specials.size(); i++ )
{
    buffs[i] => g;
    "special:" + specials[i] => buffs[i].read;
    0 => buffs[i].pos;
    <<< specials[i], buffs[i].length()  >>>;
    buffs[i].length() => now;
    separator => now;
}