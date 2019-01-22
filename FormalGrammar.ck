MidiOut mout;
MidiMsg msg;
Grammary g;

string grammar[0];
"12B" @=> grammar["A"];
"2C9" @=> grammar["B"];
"32D" @=> grammar["C"];
"4E9" @=> grammar["D"];
"5F9" @=> grammar["E"];
"62G" @=> grammar["F"];
"72H" @=> grammar["G"];
"82I" @=> grammar["H"];
"91J" @=> grammar["I"];
"156" @=> grammar["J"];

1 => int lengthPlay;
10 => float duration;
0 => int port;

mout.open(port);

fun void sendMidi(int note, int velocity) {
    note => msg.data1;
    velocity => msg.data2;
    velocity => msg.data3;
    mout.send(msg);
}

fun int runPlay(int lengthPlay){
    g.buildPlay(grammar, lengthPlay) @=> string play;
    
    for(0 => int i; i < play.length(); i++){
        play.substring(i, 1).toInt() @=> int note;
        play.charAt(i) => int velocity; -
        
        duration::second => now;
        sendMidi(note, velocity);
       
        <<< note, velocity >>>;
    }
    
    <<< "Finished, generating new grammar and relaunching... " >>>;
    
    runPlay(lengthPlay);
};

runPlay(lengthPlay);