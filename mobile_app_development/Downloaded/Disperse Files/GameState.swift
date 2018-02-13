//
//  GameState.swift
//  Disperse
//
//  Created by Tim Gegg-Harrison, Nicole Anderson on 7/27/16.
//  Copyright © 2016 TiNi Apps. All rights reserved.
//

import UIKit

class GameState {
    var board: [CardView]
    var blueTurn: Bool
    
    init() {
        board = [CardView]()
        blueTurn = true
    }
}