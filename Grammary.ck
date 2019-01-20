public class Grammary {

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
    
    fun void test() {
        <<< "test">>>;
    }    
    
    // Init
    fun string buildPlay(string grammar[]) {
        generatePlay(2) @=> string play;
        
        while (hasUnterminalSymbols(play) > 0) {
            parseAndReplace(play, grammar) @=> play;
        }
        
        return play;
    }
     
}
