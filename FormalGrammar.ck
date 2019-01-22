MidiOut mout;
MidiMsg msg;
Grammary g;

string grammar[0];
"12B" @=> grammar["A"];
"2C1" @=> grammar["B"];
"32D" @=> grammar["C"];
"4E1" @=> grammar["D"];
"5F1" @=> grammar["E"];
"62G" @=> grammar["F"];
"72H" @=> grammar["G"];
"82I" @=> grammar["H"];
"91J" @=> grammar["I"];
"151" @=> grammar["J"];

1 => int lengthPlay;
1 => float duration;
0 => int port;

mout.open(port);

fun void sendMidi(int note, int velocity) {
    144 => msg.data1;
    note => msg.data2;
    velocity => msg.data3;
    mout.send(msg);
}

fun int runPlay(int lengthPlay){
    g.buildPlay(grammar, lengthPlay) @=> string play;
    
    for(0 => int i; i < play.length(); i++){
        play.substring(i, 1).toInt() @=> int note;
        play.charAt(i) => int velocity; 
        
        duration::second => now;
        sendMidi(note, note);
       
        <<< note, velocity >>>;
    }
    
    <<< "Finished, generating new grammar and relaunching... " >>>;
    
    runPlay(lengthPlay);
};

runPlay(lengthPlay);