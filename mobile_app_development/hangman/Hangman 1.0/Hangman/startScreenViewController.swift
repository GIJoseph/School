//
//  startScreenViewController.swift
//  Hangman
//
//  Created by McVicker, Steven A on 11/19/17.
//  Copyright © 2017 McVicker, Steven A. All rights reserved.
//

import UIKit


class startScreenViewController: UIViewController {
    let toplabel: UIImageView
    let startButton: UIImageView
    let statsButton: UIImageView
    let trumpButton: UIImageView
    let disneyButton: UIImageView
    let ironManButton: UIImageView
    let board: UIImageView
    
    var stand: UIImageView
    var standBase: UIImageView
    var standArm: UIImageView
    var standHanger: UIImageView
    
    var positionOfRightArmWhenUp: CGPoint
    var positionOfRightArmWhenDown: CGPoint
    var positionOfLeftArmWhenUp: CGPoint
    var positionOfLeftArmWhenDown: CGPoint
    var armsAreUp: Bool
    var armsCanMove: Bool
    
    var stickFigure: [UIImageView]
    var game: GameState
    init()
    {
        
        board = UIImageView()
        board.image = UIImage(named: "wood")
        board.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height:screenHeight )
        
        toplabel = UIImageView()
        toplabel.image = UIImage(named: "hangmanLogo")
        toplabel.frame = CGRect(x: (0.5/8) * screenWidth, y: (0.5/8) * screenHeight, width: (7/8) * screenWidth, height: (1.5/8) * screenHeight)
        
        startButton = UIImageView()
        startButton.image = UIImage(named: "normal")
        startButton.frame = CGRect(x: (1.5/8) * screenWidth, y: (6.5/8) * screenHeight, width: (3.5/8) * screenWidth, height: (0.8/8) * screenHeight)
        startButton.center = CGPoint(x: (2/8) * screenWidth, y: (6/8) * screenHeight)
        startButton.isUserInteractionEnabled = true
        
        disneyButton = UIImageView()
        disneyButton.image = UIImage(named: "disney")
        disneyButton.frame = CGRect(x: (1.5/8) * screenWidth, y: (6.5/8) * screenHeight, width: (3.5/8) * screenWidth, height: (0.8/8) * screenHeight)
        disneyButton.center = CGPoint(x: (6/8) * screenWidth, y: (6/8) * screenHeight)
        disneyButton.isUserInteractionEnabled = true
        
        trumpButton = UIImageView()
        trumpButton.image = UIImage(named: "trump")
        trumpButton.frame = CGRect(x: (2.1/8) * screenWidth, y: (6.5/8) * screenHeight, width: (3.5/8) * screenWidth, height: (0.8/8) * screenHeight)
        trumpButton.center = CGPoint(x: (2/8) * screenWidth, y: (7/8) * screenHeight)
        trumpButton.isUserInteractionEnabled = true
        
        ironManButton = UIImageView()
        ironManButton.image = UIImage(named: "ironman")
        ironManButton.frame = CGRect(x: (1.5/8) * screenWidth, y: (6.5/8) * screenHeight, width: (3.5/8) * screenWidth, height: (0.8/8) * screenHeight)
        ironManButton.center = CGPoint(x: (6/8) * screenWidth, y: (7/8) * screenHeight)
        ironManButton.isUserInteractionEnabled = true
        
        
        
        
        
        
        
        statsButton = UIImageView()
        statsButton.image = UIImage(named: "statsButton")
        statsButton.frame = CGRect(x: 0, y: 0, width: (3/8) * screenWidth, height: (0.75/8) * screenHeight)
        statsButton.center = CGPoint(x: (4/8) * screenWidth, y: (7/8) * screenHeight)
        statsButton.isUserInteractionEnabled = true
        
        
        stand = UIImageView()
        standBase = UIImageView()
        standArm = UIImageView()
        standHanger = UIImageView()
        stickFigure = []
        
        positionOfRightArmWhenUp = CGPoint(x: 0, y: 0)
        positionOfRightArmWhenDown = CGPoint(x: 0, y: 0)
        positionOfLeftArmWhenUp = CGPoint(x: 0, y: 0)
        positionOfLeftArmWhenDown = CGPoint(x: 0, y: 0)
        armsAreUp = true
        armsCanMove = true
        
        game = GameState()
        
        super.init(nibName: nil, bundle: nil)
        
        self.view.addSubview(board)
        self.view.addSubview(toplabel)
        self.view.addSubview(startButton)
        self.view.addSubview(disneyButton)
        self.view.addSubview(trumpButton)
        self.view.addSubview(ironManButton)
        
        //self.view.addSubview(statsButton)
        startButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(startScreenViewController.startTapped(_:))))
         disneyButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(startScreenViewController.disneyTapped(_:))))
         ironManButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(startScreenViewController.ironManTapped(_:))))
         trumpButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(startScreenViewController.trumpTapped(_:))))
        
        setupStickFigure()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    @objc func startTapped(_ recognizer: UITapGestureRecognizer){
        if(recognizer.state == .ended){
            let dvc: HangManViewController = HangManViewController()
            dvc.gameMode = "normal"
            dvc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(dvc, animated: true, completion: {
                () -> Void in
                dvc.enterNewGame()
            })
        }
    }
    @objc func trumpTapped(_ recognizer: UITapGestureRecognizer){
        if(recognizer.state == .ended){
            
            let dvc: HangManViewController = HangManViewController()
            dvc.gameMode = "trump"
            dvc.backgroundImage.image = UIImage(named: "trumpbackground")
            dvc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(dvc, animated: true, completion: {
                () -> Void in
                dvc.enterNewGame()
            })
        }
    }
    @objc func ironManTapped(_ recognizer: UITapGestureRecognizer){
        if(recognizer.state == .ended){
            let dvc: HangManViewController = HangManViewController()
            dvc.gameMode = "ironMan"
             dvc.backgroundImage.image = UIImage(named: "ironback2")
            dvc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(dvc, animated: true, completion: {
                () -> Void in
                dvc.enterNewGame()
            })
        }
    }
    @objc func disneyTapped(_ recognizer: UITapGestureRecognizer){
        if(recognizer.state == .ended){
            let dvc: HangManViewController = HangManViewController()
            dvc.gameMode = "disney"
            dvc.backgroundImage.image = UIImage(named: "disneyback")
            dvc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(dvc, animated: true, completion: {
                () -> Void in
                dvc.enterNewGame()
            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupStickFigure(){
        //if we ever want to move the stick figure up or down
        let xMasterControl: CGFloat = 0
        let yMasterControl: CGFloat = -(0.9/8) * screenHeight
        
        
        /*
         Order in stickFigure Array
         --------------
         0 is Head
         1 is Body
         2 is Right Arm
         3 is Left Arm
         4 is Right Leg
         5 is Left Leg
         */
        var temp = UIImageView()//Head
        temp.image = UIImage(named: "Head.png")
        temp.frame = CGRect(x: 0, y: 0, width: (0.5 / 8) * screenHeight, height: (0.5 / 8) * screenHeight)
        temp.center = CGPoint(x: (4/8) * screenWidth + xMasterControl, y: (3.75/8) * screenHeight + yMasterControl)
        stickFigure.append(temp)
        self.view.addSubview(stickFigure[0])
        
        temp =  UIImageView()//Body
        temp.image = UIImage(named: "body.png")
        temp.frame = CGRect(x: 0, y: 0, width: 10, height: (1/8) * screenHeight)
        temp.center = CGPoint(x: (4/8) * screenWidth + xMasterControl, y: (4.5/8) * screenHeight + yMasterControl)
        stickFigure.append(temp)
        self.view.addSubview(stickFigure[1])
        
        var startingPointX: CGFloat = (4/8) * screenWidth + xMasterControl
        var startingPointY: CGFloat = (4.125/8) * screenHeight + yMasterControl
        
        temp =  UIImageView()//Right Arm
        temp.image = UIImage(named: "arm.png")
        temp.frame = CGRect(x: startingPointX, y: startingPointY, width: (0.75/8) * screenHeight, height: 10)
        var r = (temp.center.x - startingPointX / cos(0))
        positionOfRightArmWhenUp = CGPoint(x: Double(startingPointX) + Double(r) * cos(2.0.squareRoot()/2), y: Double(startingPointY) - Double(r) * sin(2.0.squareRoot() / 2))
        positionOfRightArmWhenDown = CGPoint(x: Double(startingPointX) + Double(r) * cos(2.0.squareRoot()/2), y: Double(startingPointY) + Double(r) * sin(2.0.squareRoot() / 2))
        temp.center = positionOfRightArmWhenUp
        temp.transform = CGAffineTransform(rotationAngle: -45*(CGFloat(Double.pi) / 180))
        stickFigure.append(temp)
        self.view.addSubview(stickFigure[2])
        
        temp =  UIImageView()//Left Arm
        temp.image = UIImage(named: "arm.png")
        temp.frame = CGRect(x: startingPointX, y: startingPointY, width: (0.75/8) * screenHeight, height: 10)
        positionOfLeftArmWhenUp = CGPoint(x: Double(startingPointX) - Double(r) * cos(2.0.squareRoot()/2), y: Double(startingPointY) - Double(r) * sin(2.0.squareRoot() / 2))
        positionOfLeftArmWhenDown = CGPoint(x: Double(startingPointX) - Double(r) * cos(2.0.squareRoot()/2), y: Double(startingPointY) + Double(r) * sin(2.0.squareRoot() / 2))
        temp.center = positionOfLeftArmWhenUp
        temp.transform = CGAffineTransform(rotationAngle: 45*(CGFloat(Double.pi) / 180))
        stickFigure.append(temp)
        self.view.addSubview(stickFigure[3])
        
        
        startingPointX = (4/8) * screenWidth + xMasterControl
        startingPointY = (5/8) * screenHeight + yMasterControl
        temp =  UIImageView()//Right Leg
        temp.image = UIImage(named: "arm.png")
        temp.frame = CGRect(x: startingPointX, y: startingPointY, width: (0.85/8) * screenHeight, height: 10)
        r = (temp.center.x - startingPointX) / cos(0)
        temp.center = CGPoint(x: Double(startingPointX) + Double(r) * cos(2.0.squareRoot()/2), y: Double(startingPointY) + Double(r) * sin(2.0.squareRoot() / 2))
        temp.transform = CGAffineTransform(rotationAngle: 45*(CGFloat(Double.pi) / 180))
        stickFigure.append(temp)
        self.view.addSubview(stickFigure[4])
        
        
        temp =  UIImageView()//Left Leg
        temp.image = UIImage(named: "arm.png")
        temp.frame = CGRect(x: startingPointX, y: startingPointY, width: (0.85/8) * screenHeight, height: 10)
        temp.center = CGPoint(x: Double(startingPointX) - Double(r) * cos(2.0.squareRoot()/2), y: Double(startingPointY) + Double(r) * sin(2.0.squareRoot() / 2))
        temp.transform = CGAffineTransform(rotationAngle: -45*(CGFloat(Double.pi) / 180))
        stickFigure.append(temp)
        self.view.addSubview(stickFigure[5])
        
    }
    
}

