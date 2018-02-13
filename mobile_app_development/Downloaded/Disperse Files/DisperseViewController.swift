//
//  DisperseViewController.swift
//  Disperse
//
//  Created by Tim Gegg-Harrison, Nicole Anderson on 7/27/16.
//  Copyright © 2016 TiNi Apps. All rights reserved.
//

import UIKit

let IS_IPAD: Bool = UIScreen.main.bounds.size.height == 1024

let CARDWIDTH: CGFloat = 75.0
let CARDHEIGHT: CGFloat = 107.0
let BOARDWIDTH: CGFloat = 300.0
let BOARDHEIGHT: CGFloat = 428.0
let CARDTHICKNESS: CGFloat = 3.0
let MAXCARDS: Int = 10

class DisperseViewController: UIViewController {

    private let BOARDTOPOFFSET: CGFloat
    private let BOARDLEFTOFFSET: CGFloat
    private let blue: UIColor
    private let orange: UIColor
    private let boardView: UIView
    private let playButton: UIButton
    
    let game: GameState
    var spades: Bool
    var hearts: Bool
    var diamonds: Bool
    var clubs: Bool
    
    init() {
        let CONTROLSIZE: CGFloat = UIScreen.main.bounds.size.width / 10.0
        let CONTROLSPACE: CGFloat = (UIScreen.main.bounds.size.width - (5.0 * CONTROLSIZE)) / 6.0
        let CONTROLLEFTOFFSET: CGFloat = (2.0 * CONTROLSPACE) + CONTROLSIZE
        BOARDTOPOFFSET = (UIScreen.main.bounds.size.height - (IS_IPAD ? (2.0 * BOARDHEIGHT + CONTROLSIZE) : (BOARDHEIGHT + 3.0 * CONTROLSIZE))) / 3.0
        BOARDLEFTOFFSET = (UIScreen.main.bounds.size.width - (IS_IPAD ? 2.0 * BOARDWIDTH : BOARDWIDTH)) / 2.0
        let CONTROLTOPOFFSET: CGFloat = UIScreen.main.bounds.size.height - BOARDTOPOFFSET - 1.5 * CONTROLSIZE
        
        blue = UIColor(red: 0.0, green: 0.0, blue: 0.609375, alpha: 1.0)
        orange = UIColor(red: 0.96484375, green: 0.49609375, blue: 0.0, alpha: 1.0)
        
        spades = true
        hearts = true
        diamonds = true
        clubs = true
        boardView = UIView(frame: CGRect(x: 0, y: BOARDTOPOFFSET, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-BOARDTOPOFFSET))
        playButton = UIButton(type: UIButtonType.custom)

        game = GameState()

        super.init(nibName: nil, bundle: nil)
        self.view = UIView(frame: UIScreen.main.bounds)
    
        boardView.clipsToBounds = true
        boardView.backgroundColor = UIColor.clear
        self.view.addSubview(boardView)
        
        playButton.frame = CGRect(x: CONTROLLEFTOFFSET+(CONTROLSPACE+CONTROLSIZE)*1, y: CONTROLTOPOFFSET, width: CONTROLSIZE, height: CONTROLSIZE)
        playButton.setImage(UIImage(named: "play"), for: UIControlState.normal)
        playButton.addTarget(self, action: #selector(DisperseViewController.playButtonPressed), for: UIControlEvents.touchUpInside)
        playButton.isEnabled = false
        boardView.addSubview(playButton)        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // The following 3 methods were "borrowed" from http://stackoverflow.com/questions/15710853/objective-c-check-if-subviews-of-rotated-uiviews-intersect and converted to Swift
    private func projectionOfPolygon(poly: [CGPoint], onto: CGPoint) ->  (min: CGFloat, max: CGFloat) {
        var minproj: CGFloat = CGFloat.greatestFiniteMagnitude
        var maxproj: CGFloat = -CGFloat.greatestFiniteMagnitude
        for point in poly {
            let proj: CGFloat = point.x * onto.x + point.y * onto.y
            if proj > maxproj {
                maxproj = proj
            }
            if proj < minproj {
                minproj = proj
            }
        }
        return (minproj, maxproj)
    }
    
    private func convexPolygon(poly1: [CGPoint], poly2: [CGPoint]) -> Bool {
        for i in 0..<poly1.count {
            // Perpendicular vector for one edge of poly1:
            let p1: CGPoint = poly1[i];
            let p2: CGPoint = poly1[(i+1) % poly1.count];
            let perp: CGPoint = CGPoint(x: p1.y - p2.y, y: p2.x - p1.x)
            // Projection intervals of poly1, poly2 onto perpendicular vector:
            let (minp1,maxp1): (CGFloat,CGFloat) = self.projectionOfPolygon(poly: poly1, onto: perp)
            let (minp2,maxp2): (CGFloat,CGFloat) = self.projectionOfPolygon(poly: poly2, onto: perp)
            // If projections do not overlap then we have a "separating axis" which means that the polygons do not intersect:
            if maxp1 < minp2 || maxp2 < minp1 {
                return false
            }
        }
        // And now the other way around with edges from poly2:
        for i in 0..<poly2.count {
            // Perpendicular vector for one edge of poly2:
            let p1: CGPoint = poly2[i];
            let p2: CGPoint = poly2[(i+1) % poly2.count];
            let perp: CGPoint = CGPoint(x: p1.y - p2.y, y:
                p2.x - p1.x)
            // Projection intervals of poly1, poly2 onto perpendicular vector:
            let (minp1,maxp1): (CGFloat,CGFloat) = self.projectionOfPolygon(poly: poly1, onto: perp)
            let (minp2,maxp2): (CGFloat,CGFloat) = self.projectionOfPolygon(poly: poly2, onto: perp)
            // If projections do not overlap then we have a "separating axis" which means that the polygons do not intersect:
            if maxp1 < minp2 || maxp2 < minp1 {
                return false
            }
        }
        return true
    }

    private func viewsIntersect(view1: UIView, view2: UIView) -> Bool {
        
        return self.convexPolygon(poly1: [view1.convert(view1.bounds.origin, to: nil), view1.convert(CGPoint(x: view1.bounds.origin.x + view1.bounds.size.width, y: view1.bounds.origin.y), to: nil), view1.convert(CGPoint(x: view1.bounds.origin.x + view1.bounds.size.width, y: view1.bounds.origin.y + view1.bounds.height), to: nil), view1.convert(CGPoint(x: view1.bounds.origin.x, y: view1.bounds.origin.y + view1.bounds.height), to: nil)], poly2: [view2.convert(view1.bounds.origin, to: nil), view2.convert(CGPoint(x: view2.bounds.origin.x + view2.bounds.size.width, y: view2.bounds.origin.y), to: nil), view2.convert(CGPoint(x: view2.bounds.origin.x + view2.bounds.size.width, y: view2.bounds.origin.y + view2.bounds.height), to: nil), view2.convert(CGPoint(x: view2.bounds.origin.x, y: view2.bounds.origin.y + view2.bounds.height), to: nil)])
    }
    
    private func cardIsOpenAtIndex(i: Int) -> Bool {
        var j: Int = i+1
        while j < game.board.count && (game.board[j].removed || !self.viewsIntersect(view1: game.board[i], view2: game.board[j])) {
            j += 1
        }
        return (j >= game.board.count)
    }
    
    private func unhighlightCards() {
        for card in game.board {
            card.highlight("\0")
        }
    }

    private func highlightOpenCards() {
        for i in 0..<game.board.count {
            let card: CardView = game.board[i]
            if (card.suit == "s" && spades) || (card.suit == "h" && hearts) || (card.suit == "d" && diamonds) || (card.suit == "c" && clubs) {
                if !card.removed && self.cardIsOpenAtIndex(i: i) {
                    card.highlight("g")
                }
            }
        }
    }
    
    private func rehighlightOpenCards() {
        self.unhighlightCards()
        self.highlightOpenCards()
    }
    
    private func setSuitIndicators() {
        spades = true
        hearts = true
        diamonds = true
        clubs = true
    }
    
    func updateSuitIndicatorForCard(card: CardView) {
        if card.suit == "s" {
            spades = false
        }
        else if card.suit == "h" {
            hearts = false
        }
        else if card.suit == "d" {
            diamonds = false
        }
        else {
            clubs = false
        }
    }
    
    private func setBackground() {
        if game.blueTurn {
            self.view.backgroundColor = blue
        }
        else {
            self.view.backgroundColor = orange
        }
    }

    func slideCard(_ recognizer: UIPanGestureRecognizer) {
        let card: CardView = recognizer.view as! CardView
        if card.highlighted() && !card.removed {
            let translation: CGPoint = recognizer.translation(in: boardView)
            recognizer.view?.center = CGPoint(x: recognizer.view!.center.x + translation.x, y:
                recognizer.view!.center.y + translation.y)
            recognizer.setTranslation(CGPoint(x: 0, y: 0), in: boardView)
            if recognizer.state == UIGestureRecognizerState.ended {
                self.updateSuitIndicatorForCard(card: card)
                card.removed = true
                card.removeFromSuperview()
                self.rehighlightOpenCards()
                if !playButton.isEnabled {
                    playButton.isEnabled = true
                }
            }
        }
    }

    private func cleanUpBoard() {
        for card in game.board {
            if !card.removed {
                card.removeFromSuperview()
            }
        }
        game.board = [CardView]()
    }

    private func layoutBoard() {
        for card in game.board {
            if !card.removed {
                boardView.addSubview(card)
            }
        }
    }
    
    private func createCards() {
        let numOfCards: Int = MAXCARDS + Int(arc4random_uniform(UInt32(MAXCARDS/2)))
        var cardValue: String = "b"
        var cardSuit: String = "c"
        var card: CardView
        game.board = [CardView]()
        for _ in 0..<numOfCards {
            card = CardView(suit: cardSuit, value: cardValue)
            game.board.append(card)
            if cardSuit == "c" {
                cardSuit = "d"
            }
            else if cardSuit == "d" {
                cardSuit = "h"
            }
            else if cardSuit == "h" {
                cardSuit = "s"
            }
            else {
                cardSuit = "c"
                if cardValue == "b" {
                    cardValue = "c"
                }
                else if cardValue == "c" {
                    cardValue = "d"
                }
                else if cardValue == "d" {
                    cardValue = "e"
                }
                else {
                    cardValue = "b"
                }
            }
        }
    }
    
    private func layoutCard(card: CardView) {
        var center: CGPoint = CGPoint(x: 0, y: 0)
        let radianConversion: CGFloat = CGFloat(Double.pi) / 180
        center.x = BOARDLEFTOFFSET + (IS_IPAD ? (2*card.location.x) : card.location.x)
        center.y = BOARDTOPOFFSET + (IS_IPAD ? (2*card.location.y) : card.location.y)
        card.center = center
        card.transform = CGAffineTransform(rotationAngle: card.rotation*radianConversion)
    }
    
    func displayCard(card: CardView, index: Int, rotation: CGFloat, location: CGPoint) {
        card.index = index
        card.rotation = rotation
        card.location = location
        card.removed = false
        card.isUserInteractionEnabled = true
        card.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(DisperseViewController.slideCard(_:))))
        self.layoutCard(card: card)
    }
    
    func displayCards() {
        var x,y,rotation: CGFloat
        x = BOARDWIDTH/2
        y = BOARDHEIGHT/2
        self.displayCard(card: game.board[0], index: 0, rotation: 0, location: CGPoint(x: x, y: y))
        for i in 1..<game.board.count {
            x = BOARDWIDTH/2 + (arc4random_uniform(2)==0 ? -1.0 : 1.0)*CGFloat(arc4random_uniform(UInt32(CARDWIDTH)))
            y = BOARDHEIGHT/2 + (arc4random_uniform(2)==0 ? -1.0 : 1.0)*CGFloat(arc4random_uniform(UInt32(CARDHEIGHT)))
            rotation = CGFloat(arc4random_uniform(45))
            self.displayCard(card: game.board[i], index: i, rotation: rotation, location: CGPoint(x: x, y: y))
        }
    }
    
    func shuffleCards() {
        var card: CardView
        for _ in 0...999 {
            let j: Int = Int(arc4random_uniform(UInt32(game.board.count)))
            let k: Int = Int(arc4random_uniform(UInt32(game.board.count)))
            card = game.board[j]
            game.board[j] = game.board[k]
            game.board[k] = card
        }
    }
    
    func createBoard() {
        self.createCards()
        self.shuffleCards()
        self.displayCards()
    }
    
    func enterNewGame() {
        game.blueTurn = true
        self.setBackground()
        self.cleanUpBoard()
        self.createBoard()
        self.layoutBoard()
        self.setSuitIndicators()
        self.highlightOpenCards()
        playButton.isEnabled = false
    }
    
    func playButtonPressed() {
        playButton.isEnabled = false
        game.blueTurn = !game.blueTurn
        self.setBackground()
        self.setSuitIndicators()
        self.unhighlightCards()
        self.highlightOpenCards()
    }
}
