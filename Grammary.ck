public class Grammary {

    fun string generate(int length) {
        "ABCDEFGHIJ" @=> string vocabulary;
        "" @=> string text;
        
        for(0 => int i; i< length; i++){
            Math.random2(0, vocabulary.length() - 1) => int idx;
            vocabulary.substring(idx,1) => string char;
            char +=> text;
        }    
       
       "0" +=> text; // Finish with ZERO   
                        
        <<< "Generated ->", trimZero(text) >>>;
                
        return text;
    }
    
    fun int hasUnterminal(string words) {
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
    
    fun string replace(string words, string rules[]) { 
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
        
        //<<< "replace ->", trimZero(play) >>>;
        
        return play;
    }            


    fun string buildPlay(string grammar[], int length) {
        generate(length) @=> string play;
             
        while (hasUnterminal(play) > 0) {
            replace(play, grammar) @=> play;
        }
        
        return trimZero(play);
    }
    
    fun string trimZero(string text){
        return text.substring(0, text.length() -1);
    }    
}    
