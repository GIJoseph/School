//
//  DrawDashUIView.swift
//  Hangman
//
//  Created by McVicker, Steven A on 10/31/17.
//  Copyright © 2017 McVicker, Steven A. All rights reserved.
//

import UIKit

class DrawDashUIView: UIView {
    
    init(){
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: letterSize, height: 3))
        super.init(frame: CGRect(x: 0, y: 0, width: letterSize, height: 3))
        path.fill()
        path.stroke()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

