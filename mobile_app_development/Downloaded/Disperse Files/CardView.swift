//
//  CardView.swift
//  Disperse
//
//  Created by Tim Gegg-Harrison, Nicole Anderson on 7/27/16.
//  Copyright © 2016 TiNi Apps. All rights reserved.
//

import UIKit

class CardView: UIImageView {

    var suit: String
    var value: String
    var highlightColor: String
    var index: Int
    var rotation: CGFloat
    var location: CGPoint
    var removed: Bool
    
    init(suit: String, value: String) {
        self.suit = suit
        self.value = value
        highlightColor = "\0"
        index = 0
        rotation = 0
        location = CGPoint(x: 0, y: 0)
        removed = false
        super.init(frame: CGRect(x: 0, y: 0, width: (IS_IPAD ? 2*CARDWIDTH : CARDWIDTH), height: (IS_IPAD ? 2*CARDHEIGHT : CARDHEIGHT)))
        image = UIImage(named: "\(suit)-\(value)-150.png")
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func highlight(_ color: String) {
        highlightColor = color
        image = UIImage(named: "\(suit)-\(value)-150\(color).png")
    }
    
    func highlighted() -> Bool {
        return highlightColor != "\0"
    }
}
