MidiOut mout;
MidiMsg msg;
Grammary g;

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

1 => int lengthPlay;
0.5 => float duration;
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
        play.substring(i, 1) @=> string letter;
        play.charAt(i) => int code; 
        
        duration::second => now;
        sendMidi(code, code);
       
        <<< letter, code >>>;
    }
    
    <<< "Finished, generating new grammar and relaunching... " >>>;
    
    runPlay(lengthPlay);
};

runPlay(lengthPlay);