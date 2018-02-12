//
//  GameState.swift
//  Hangman
//
//  Created by McVicker, Steven A on 10/31/17.
//  Copyright © 2017 McVicker, Steven A. All rights reserved.
//

import UIKit

class GameState: NSObject, NSCoding
{
    
    var words: [String]
    var numWrong: Int
    var currentWord: String
    var alphebetLetters: [LetterView]
    var currentWordLetters: [LetterView]
    
    
    
    override init()
    {
    words = [String]()
    numWrong = 0
    currentWord = ""
    alphebetLetters = []
    currentWordLetters = []
    
    }
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(words, forKey: "words")
        aCoder.encode(numWrong, forKey: "numWrong")
        aCoder.encode(currentWord, forKey: "currentWord")
        aCoder.encode(alphebetLetters, forKey: "alphebetLetters")
        aCoder.encode(currentWordLetters, forKey: "currentWordLetters")

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        words = aDecoder.decodeObject(forKey: "words") as! [String]
        numWrong = aDecoder.decodeInteger(forKey: "numWrong")
        currentWord = aDecoder.decodeObject(forKey: "currentWord") as! String
        alphebetLetters = aDecoder.decodeObject(forKey: "alphebetLetters") as! [LetterView]
        currentWordLetters = aDecoder.decodeObject(forKey: "currentWordLetters") as! [LetterView]
       
        
    }
    
    
}
