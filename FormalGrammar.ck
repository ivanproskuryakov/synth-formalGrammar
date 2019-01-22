MidiOut mout;
MidiMsg msg;
Grammary g;

string grammar[0];
"49B" @=> grammar["A"];
"2C9" @=> grammar["B"];
"39D" @=> grammar["C"];
"499" @=> grammar["D"];
"5F9" @=> grammar["E"];
"64G" @=> grammar["F"];
"71H" @=> grammar["G"];
"81I" @=> grammar["H"];
"93J" @=> grammar["I"];
"456" @=> grammar["J"];

1 => int lengthPlay;
1 => float duration;
0 => int port;

mout.open(port) => int res;
<<< res >>>;

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
        sendMidi(note, velocity);
       
        <<< note, velocity >>>;
    }
    
    <<< "Finished, generating new grammar and relaunching... " >>>;
    
    runPlay(lengthPlay);
};

<<< "Starting ... " >>>;
    
runPlay(lengthPlay);