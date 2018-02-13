
import Foundation

let phrase = "It doesn't matter in what order the letters of a word appear as long as the first and last characters are in the right place the rest can be a total mess and you can probably still read it"

func scramble(sentence: String) -> String {
    var result = ""
    
    let scrambleWord = { (string: String) -> String in
        guard string.characters.count > 3 else {
            return string
        }
        
        let characters = Array(string.characters)
        var middleCharacters = Array(characters[1..<characters.count - 1])
        let count = middleCharacters.count
        
        for i in 0..<count {
            let j = Int(arc4random_uniform(UInt32(count)))
            
            guard i != j else { continue }
            
            swap(&middleCharacters[i], &middleCharacters[j])
        }
        
        return "\(characters.first!)" + String(middleCharacters) + "\(characters.last!)"
    }
    
    sentence.characters.split(separator: " ")
        .map(String.init)
        .map(scrambleWord)
        .forEach { result += "\($0) " }
    
    return result
}

let phraseScrambled = scramble(sentence: phrase)

print(phraseScrambled)
