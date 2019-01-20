// Var ===========================
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

// Functions
fun string generatePlay(int length) {
    "ABCDEFGHIJ" @=> string vocabulary;
    "" @=> string text;
    
    for(0 => int i; i<length; i++){
        Math.random2(0, vocabulary.length() - 1) => int idx;
        vocabulary.substring(idx,1) => string char;
        char +=> text;
    }    

    "0" +=> text; // Finish with ZERO   
    
    <<< "generatePlay ->", text >>>;
    
    return text;
}

fun int hasUnterminalSymbols(string words) {
   for(0 => int i; i<words.length(); i++){
        words.charAt(i) => int char;     
        if ((char >= 65) && (char <= 90)) { // in A..Z
            return char;
        }
    }
    
    if (words.find('0')) { // End if ZERO found
        return 0;
    }
    
    return 0;
}

fun string parseAndReplace(string words, string rules[]) { 
    "" @=> string play;
    
    for(0 => int i; i<words.length(); i++){
        words.substring(i, 1) @=> string letter;
        
        if (rules[letter] != null) {
            rules[letter] @=> string rule; 
            rules[letter] +=> play;
        } else {
            letter +=> play;
        }
    }
    
    <<< "parseAndReplace ->", play >>>;
            
    return play;
}


fun string buildPlay() {
    generatePlay(2) @=> string play;
    
    while (hasUnterminalSymbols(play) > 0) {
        parseAndReplace(play, grammar) @=> play;
    }
    
    return play;
}

// Init
buildPlay() @=> string play;
now + 10::second => time later;

// Run
while (true) {
    1::second => now;
    <<< play >>>;
    <<< now == later >>>;

    if (now == later) {
        buildPlay() @=> string play;
        now + 10::second => later;
    }
}













