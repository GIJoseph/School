//
//  LetterView.swift
//  Hangman
//
//  Created by McVicker, Steven A on 11/3/17.
//  Copyright © 2017 McVicker, Steven A. All rights reserved.
//

import UIKit

class LetterView: UIImageView {
    
    var val: Character
    var removed: Bool

    init(_ s: Character) {
        val = s
        removed = false
        super.init(frame: CGRect(x: 0, y: 0, width: screenWidth * (5/69), height: screenWidth * (5/69)))
        image = UIImage(named: "\(val).png")
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        val = Character(aDecoder.decodeObject(forKey: "val") as! String)
        removed = aDecoder.decodeBool(forKey: "removed")
        
        super.init(coder: aDecoder)
        self.frame = CGRect(x: 0, y: 0, width: screenWidth * (5/69), height: screenWidth * (5/69))
        image = UIImage(named: "\(val).png")
    }
    override func encode(with aCoder: NSCoder){
        aCoder.encode(String(val), forKey: "val")
        aCoder.encode(removed, forKey: "removed")
    }

    func value() -> Character {
        return val;
    }
    
}
