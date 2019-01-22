string grammar[0];
"abB" @=> grammar["A"];
"eCa" @=> grammar["B"];
"aaD" @=> grammar["C"];
"ccE" @=> grammar["D"];
"xcF" @=> grammar["E"];
"afG" @=> grammar["F"];
"aaH" @=> grammar["G"];
"acI" @=> grammar["H"];
"adJ" @=> grammar["I"];
"aaa" @=> grammar["J"];

Grammary g;

10 => int length;
g.buildPlay(grammar, length) @=> string play;

now + length::second => time later;

while (true) {
    1::second => now;
    (later - now)/second => float timeLeft;

    <<< timeLeft, play >>>;
    
    if (now == later) {
        g.buildPlay(grammar, length) @=> string play;
        now + length::second => later;
    }
}
