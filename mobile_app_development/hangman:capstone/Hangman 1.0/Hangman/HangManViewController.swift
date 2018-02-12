//
//  HangManViewController.swift
//  Hangman
//
//  Created by McVicker, Steven A on 10/17/17.
//  Copyright © 2017 McVicker, Steven A. All rights reserved.
//

import UIKit

let IS_IPAD: Bool = UIScreen.main.bounds.size.height == 1024
let BOARDWIDTH: CGFloat = 300.0
let BOARDHEIGHT: CGFloat = 428.0

let screenWidth: CGFloat = UIScreen.main.bounds.size.width
let screenHeight: CGFloat = UIScreen.main.bounds.size.height
let oneSidedLetterPadding: CGFloat = (((screenWidth / 8) - letterSize) / 2) //finds the amount of padding on one side of letter to keep spacing for edge of screen
let letterSize: CGFloat = screenWidth * (5/69) // find the letter size based on screen width and a

class HangManViewController: UIViewController {
    
    let board: UIImageView
    let quitButton: UIImageView
    let restartButton: UIImageView
    
    var dashLabel: UILabel
    var letterLabel: UILabel
    /*
    var BASE: UIImageView
    var HEAD: UIImageView
    var TORSO: UIImageView
    var LEFTARM: UIImageView
    var RIGHTARM: UIImageView
    var LEFTLEG: UIImageView
    var RIGHTLEG: UIImageView
     */
    var stand: UIImageView
    var standBase: UIImageView
    var standArm: UIImageView
    var standHanger: UIImageView
    var backgroundImage: UIImageView
    var positionOfRightArmWhenUp: CGPoint
    var positionOfRightArmWhenDown: CGPoint
    var positionOfLeftArmWhenUp: CGPoint
    var positionOfLeftArmWhenDown: CGPoint
    var armsAreUp: Bool
    var armsCanMove: Bool
    var armsCounter: Int
    
    var stickFigure: [UIImageView]
    
    var alphabet:[Character]
    var dashes:[UIImageView]
    
    var game: GameState
    
    //var currentWord: String
    
    var guessButton: UIButton
    
    var chosenWord: String!
    
    //var numWrong: Int
    
    let fileManager: FileManager = FileManager.default
    let filePath: String = "\(NSHomeDirectory())/tmp/hangman.txt"
    
    let invisibleCover: UIImageView
    var gameDonePic: UIImageView
    var tapToContinue: UIImageView
    
    var gameMode: String
    init()
    {
      //  //NSLog("Absolute path for Home Directory: \(NSHomeDirectory())")
        
        gameMode = ""
        let dirPath: String = "\(NSHomeDirectory())/tmp/directory"
        var isDir: ObjCBool = true
        if fileManager.fileExists(atPath: dirPath, isDirectory: &isDir) {
            if isDir.boolValue {
              //  //NSLog("file exists and is a directory")
            }
            else {
                //NSLog("file exists and is not a directory")
            }
        }
        else {
          //  ////NSLog("file does not exist")
            do {
                try fileManager.createDirectory(atPath: dirPath, withIntermediateDirectories: true, attributes: nil)
            }
            catch {
                //NSLog("directory not created")
            }
        }
        
        invisibleCover = UIImageView()
        invisibleCover.image = UIImage(named: "transparentPixel08.png")
        invisibleCover.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        
        
        tapToContinue = UIImageView()
        tapToContinue.image = UIImage(named:"continue.png")
        gameDonePic = UIImageView()
        
        
        quitButton = UIImageView()
        quitButton.image = UIImage(named: "quit.png")
        quitButton.frame = CGRect(x: (0.5/8) * screenWidth, y: (7.25/8) * screenHeight, width: (3/8) * screenWidth, height: (0.75/8) * screenHeight)
        
        
        restartButton = UIImageView()
        restartButton.image = UIImage(named: "restart-1.png")
        restartButton.frame = CGRect(x: (4.5/8) * screenWidth, y: (7.25/8) * screenHeight, width: (3/8) * screenWidth, height: (0.75/8) * screenHeight)
        
        board = UIImageView()
        board.image = UIImage(named: "board")
        board.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height:(4/8)  * screenWidth + 20)
        
        alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        
        game = GameState()
       
        dashLabel = UILabel()
        letterLabel = UILabel()
        
       
        
        guessButton = UIButton()
        guessButton.setTitle("\(screenWidth)", for: .normal)
        guessButton.frame = CGRect.init(x: (UIScreen.main.bounds.size.width / 2) - 120, y: UIScreen.main.bounds.size.height - 100, width: 250, height: 50)

        //(#/8) * screenWidth :: finds the initial position for the letter to be placed
        //(#/8) * screenWidth + 20 :: +20 to avoid notification bar, (#/8) * screenWidth to keep consistant letter spacing
        /*
        BASE = UIImageView(image: #imageLiteral(resourceName: "Gallow"))
        BASE.frame = CGRect(x: 100, y: 250, width: 200, height: 200)
        
        HEAD = UIImageView(image: #imageLiteral(resourceName: "head"))
        HEAD.frame = CGRect(x: 100, y: 250, width: 200, height: 200)
        
        TORSO = UIImageView(image: #imageLiteral(resourceName: "torso"))
        TORSO.frame = CGRect(x: 100, y: 250, width: 200, height: 200)
        
        LEFTARM = UIImageView(image: #imageLiteral(resourceName: "leftArm"))
        LEFTARM.frame = CGRect(x: 100, y: 250, width: 200, height: 200)
        
        RIGHTARM = UIImageView(image: #imageLiteral(resourceName: "RightArm"))
        RIGHTARM.frame = CGRect(x: 100, y: 250, width: 200, height: 200)
        
        LEFTLEG = UIImageView(image: #imageLiteral(resourceName: "leftLeg"))
        LEFTLEG.frame = CGRect(x: 100, y: 250, width: 200, height: 200)
        
        RIGHTLEG = UIImageView(image: #imageLiteral(resourceName: "rightLeg"))
        RIGHTLEG.frame = CGRect(x: 100, y: 250, width: 200, height: 200)
        
        
        letterLabel.frame = CGRect(x: screenWidth/2, y: 400, width: screenWidth, height: 100)
        letterLabel.font = UIFont.boldSystemFont(ofSize: 70)
        letterLabel.center = CGPoint(x: (screenWidth/2), y: 400)
        letterLabel.textAlignment = .center
        
        dashLabel.frame = CGRect(x: screenWidth/2, y: 525, width: screenWidth, height: 100)
        dashLabel.font = UIFont.boldSystemFont(ofSize: 70)
        dashLabel.center = CGPoint(x: (screenWidth/2), y: 525)
        dashLabel.textAlignment = .center
        */
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
        armsCounter = 0
        
        dashes = []
        backgroundImage = UIImageView()
        super.init(nibName: nil, bundle: nil)
        
        let fileURLProject = Bundle.main.path(forResource: "test", ofType: "txt")
        var readStringProject = ""
        do {
            readStringProject = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            
            print("Failed to read")
            print(error)
        }
        var wordsArray = readStringProject.components(separatedBy: "\n")
        for word in wordsArray {
            game.words.append(word)
            print(word)
        }
        
        self.view = UIView(frame: UIScreen.main.bounds)
        backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "grass.jpeg")
    
      
        self.view.insertSubview(backgroundImage, at: 0)
        
        /*
        self.view.addSubview(BASE)
        self.view.addSubview(HEAD)
        self.view.addSubview(TORSO)
        self.view.addSubview(RIGHTARM)
        self.view.addSubview(LEFTARM)
        self.view.addSubview(RIGHTLEG)
        self.view.addSubview(LEFTLEG)
        */
        
        self.view.addSubview(board)
        self.view.addSubview(dashLabel)
        self.view.addSubview(letterLabel)
        
       // self.view.addSubview(guessButton)
        self.view.addSubview(quitButton)
        self.view.addSubview(restartButton)
        
        restartButton.isUserInteractionEnabled = true
        restartButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HangManViewController.restartTapped(_:))))
        
        quitButton.isUserInteractionEnabled = true
        quitButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HangManViewController.quitTapped(_:))))
        
        /*
        for i in 0...25 {
            let wPlace: Int = i % 9
            let cgWPlace: CGFloat = CGFloat(wPlace)
            let hPlace: Int = i / 9
            let cgHPlace: CGFloat = CGFloat(hPlace)
            game.alphebetLetters.append(contentsOf: LetterView(alphabet[i]))
            //lv.addGestureRecognizer(gestureStuffHere)
            lv.frame = CGRect(x: (cgWPlace/9) * screenWidth + oneSidedLetterPadding, y: (cgHPlace/9) * screenWidth + 20, width: letterSize, height: letterSize)
            self.view.addSubview(lv)
            lv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.letterTapped(_:))))
        }
        */
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func enterNewGame()
    {
        NSLog("\(gameMode)")
        let data: Data? = fileManager.contents(atPath: filePath)
        setupStickFigure()
        restoreGameState()
        if (data == nil) {
            randomPicker()
            setDashes()
            self.game.numWrong = 0
            self.game.currentWordLetters = []
            setCurrentWordLettersPosition()
            for Letter in game.currentWordLetters{
                Letter.removed = true
            }
            game.alphebetLetters = []
            setLetters()
            displayLetters(game.alphebetLetters)
            displayLetters(game.currentWordLetters)
        }else{
            restoreGameState()
            setDashes()
            setCurrentWordLettersPosition()
            setLetters()
            displayLetters(game.alphebetLetters)
            displayLetters(game.currentWordLetters)
            reAddStickFigure()
            if(game.numWrong == 6){
                addInvisiblePicture(didWin: false)
            }
            if(wordIsSpelt()){
                addInvisiblePicture(didWin: true)
            }
        }
      
        
        
    }

    func setDashes()
    {
        if(dashes.count != 0){
            dashes = []
        }
        let numOfLetters = game.currentWord.count
        let spacing = ((screenWidth - (letterSize + 10.0) * CGFloat(numOfLetters)) / 2) + 10
        for i in 0..<numOfLetters
        {
            let temp = UIImageView()
            temp.image = UIImage(named: "dash.png")
            temp.frame = CGRect(x: 0, y: 0, width: letterSize * 1.0, height: 5)
            temp.center = CGPoint(x: (letterSize / 2) + CGFloat(i) * (letterSize + 10) + spacing, y: (7/8) * screenHeight)
            dashes.append(temp)
            self.view.addSubview(dashes[i])
        }
    }
    func setCurrentWordLettersPosition()
    {
        
        var characters = Array(game.currentWord.uppercased())
        if(game.currentWordLetters.count == 0){
            for i in 0..<characters.count
            {
                let temp = LetterView(characters[i])
                temp.frame = CGRect(x: 0, y: 0, width: letterSize, height: letterSize)
                temp.center = CGPoint(x: dashes[i].center.x, y: dashes[i].center.y - (letterSize / 2.0) - 3)
                self.game.currentWordLetters.append(temp)
            }
        }
        else{
            for i in 0..<characters.count{
                game.currentWordLetters[i].frame = CGRect(x: 0, y: 0, width: letterSize, height: letterSize)
                game.currentWordLetters[i].center = CGPoint(x: dashes[i].center.x, y: dashes[i].center.y - (letterSize / 2.0) - 3)
            }
        }
        
        
    }
    
    func randomPicker()
    {
        let n = Int(arc4random_uniform(UInt32(game.words.count - 1)))
       // //NSLog("\(game.words[n])")
        game.currentWord = game.words[n]
       
    }
    
    @objc func letterTapped(_ recognizer: UITapGestureRecognizer){
        if(recognizer.state == .ended){
            var letterExists = false
            armsCanMove = true
            armsCounter = 0
            let letter = recognizer.view as! LetterView
            letter.removeFromSuperview()
            letter.removed = true
            var gameDone = true
            for Letter in game.currentWordLetters{
                if(Letter.value() == letter.value()){
                    letterExists = true
                    self.view.addSubview(Letter)
                    Letter.removed = false
                }
                if(Letter.removed){
                    gameDone = false
                }
            }
            if(gameDone){
                addInvisiblePicture(didWin: true)
            }else if(!letterExists){
                wrongAnswer()
            }
            saveGameState()
            
        }
    }
    @objc func restartTapped(_ recognizer: UITapGestureRecognizer){
        if(recognizer.state == .ended){
            restartGame()
        }
    }
    func restartGame(){
        gameDonePic.removeFromSuperview()
        invisibleCover.isUserInteractionEnabled = false
        invisibleCover.removeFromSuperview()
        for i in 0..<stickFigure.count{
            stickFigure[i].removeFromSuperview()
        }
        for i in 0..<dashes.count{
            dashes[i].removeFromSuperview()
        }
        for i in 0..<self.game.currentWordLetters.count{
            self.game.currentWordLetters[i].removeFromSuperview()
        }
        for i in 0..<self.game.alphebetLetters.count{
            self.game.alphebetLetters[i].removeFromSuperview()
        }
        self.game.alphebetLetters = []
        armsCanMove = false
        armsAreUp = true
        deleteGameFile()
        enterNewGame()
    }
    @objc func quitTapped(_ recognizer: UITapGestureRecognizer){
        if(recognizer.state == .ended){
            self.presentingViewController?.dismiss(animated: true, completion: { () -> Void in
                //NSLog("Dismissing game")
            })
            /*
            let avc: StatsViewController = StatsViewController()
            avc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(avc, animated: true, completion: {
                () -> Void in
                //NSLog("Dismissing game")
            })
 */
            
        }
    }
    func setLetters(){
        if(game.alphebetLetters.count != 0){
            for currentLetter in game.alphebetLetters{
                currentLetter.removeFromSuperview()
            }
        }
        var i = 0, xPosition = CGFloat(0), yPosition = CGFloat(0)
        while(yPosition < 3){
            if(game.alphebetLetters.count == i){
                game.alphebetLetters.append(LetterView(alphabet[i]))
            }
            game.alphebetLetters[i].isUserInteractionEnabled = true
            game.alphebetLetters[i].frame = CGRect(x: (xPosition/8) * screenWidth + oneSidedLetterPadding, y: (yPosition/8) * screenWidth + 20, width: letterSize, height: letterSize)
            game.alphebetLetters[i].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HangManViewController.letterTapped(_:))))
            i = i + 1
            xPosition = xPosition + 1
            if(xPosition >= 8){
                
                xPosition = 0
                yPosition = yPosition + 1
            }
        }
        if(game.alphebetLetters.count == 24){
            game.alphebetLetters.append(LetterView(alphabet[24]))
        }
        game.alphebetLetters[24].frame = CGRect(x: (3/8) * screenWidth + oneSidedLetterPadding, y: (3/8) * screenWidth + 20, width: letterSize, height: letterSize)
            
        //self.view.addSubview(game.alphebetLetters[24])
        game.alphebetLetters[24].isUserInteractionEnabled = true
        game.alphebetLetters[24].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HangManViewController.letterTapped(_:))))
        
        if(game.alphebetLetters.count == 25){
            game.alphebetLetters.append(LetterView(alphabet[25]))
        }
        game.alphebetLetters[25].frame = CGRect(x: (4/8) * screenWidth + oneSidedLetterPadding, y: (3/8) * screenWidth + 20, width: letterSize, height: letterSize)
        //self.view.addSubview(game.alphebetLetters[25])
        game.alphebetLetters[25].isUserInteractionEnabled = true
        game.alphebetLetters[25].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HangManViewController.letterTapped(_:))))
    }
    
    func wrongAnswer(){
        
        if(game.numWrong <= 5){
            self.view.addSubview(stickFigure[game.numWrong])
            self.view.sendSubview(toBack: stickFigure[1])
            self.view.sendSubview(toBack: backgroundImage)
        }
        if(game.numWrong == 5){
            for letter in game.alphebetLetters{
                letter.isUserInteractionEnabled = false
            }
            animateStruggle()
            
            //self.view.isUserInteractionEnabled = true
            //self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HangManViewController.restartTapped(_:))))
            addInvisiblePicture(didWin: false)
        }
        game.numWrong += 1
    }
    /*
    @objc func screenTapped(_ recognizer: UITapGestureRecognizer){
        if(recognizer.state == .ended){
            //self.view.removeGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HangManViewController.screenTapped(_:))))
            self.enterNewGame()
        }
    }
    */
    func setupStickFigure(){
        //if we ever want to move the stick figure up or down
        let xMasterControl: CGFloat = 0
        let yMasterControl: CGFloat = (0.25 / 8) * screenHeight
        
        
        stand = UIImageView()
        stand.image = UIImage(named: "body.png")
        stand.frame = CGRect(x: 0, y: 0, width: 20, height: (3/8) * screenHeight)
        stand.center = CGPoint(x: (2/8) * screenWidth + xMasterControl, y: (4.5/8) * screenHeight + yMasterControl)
        self.view.addSubview(stand)
        
        standArm = UIImageView()
        standArm.image = UIImage(named: "arm.png")
        standArm.frame = CGRect(x: 0, y: 0, width: (2/8) * screenWidth + 20, height: 20)
        standArm.center = CGPoint(x: (3/8) * screenWidth + xMasterControl, y: (3/8) * screenHeight + yMasterControl)
        self.view.addSubview(standArm)
        
        standHanger = UIImageView()
        standHanger.image = UIImage(named: "body.png")
        standHanger.frame = CGRect(x: 0, y: 0, width: 20, height: (0.5/8) * screenHeight)
        standHanger.center = CGPoint(x: (4/8) * screenWidth + xMasterControl, y: (3.25/8) * screenHeight + yMasterControl)
        self.view.addSubview(standHanger)
        
        standBase = UIImageView()
        standBase.image = UIImage(named: "arm.png")
        standBase.frame = CGRect(x: 0, y: 0, width: (1/2) * screenWidth, height: 20)
        standBase.center = CGPoint(x: (3/8) * screenWidth + xMasterControl, y: (6/8) * screenHeight + yMasterControl)
        self.view.addSubview(standBase)
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
        if(gameMode == "normal")
        {
            temp.image = UIImage(named: "Head.png")
            temp.frame = CGRect(x: 0, y: 0, width: (0.6 / 8) * screenHeight, height: (0.6 / 8) * screenHeight)
        }
        if(gameMode == "trump")
        {
            temp.image = UIImage(named: "trump-1")
            temp.frame = CGRect(x: 0, y: 0, width: (0.8 / 8) * screenHeight, height: (0.8 / 8) * screenHeight)
        }
        if(gameMode == "ironMan")
        {
            temp.image = UIImage(named: "ironman-1")
            temp.frame = CGRect(x: 0, y: 0, width: (0.8 / 8) * screenHeight, height: (0.8 / 8) * screenHeight)
        }
        if(gameMode == "disney")
        {
            temp.image = UIImage(named: "dis")
            temp.frame = CGRect(x: 0, y: 0, width: (0.8 / 8) * screenHeight, height: (0.8 / 8) * screenHeight)
        }
        
        
        temp.center = CGPoint(x: (4/8) * screenWidth + xMasterControl, y: (3.75/8) * screenHeight + yMasterControl)
        
        stickFigure.append(temp)
        //self.view.addSubview(stickFigure[0])
        
        temp =  UIImageView()//Body
        temp.image = UIImage(named: "body.png")
        temp.frame = CGRect(x: 0, y: 0, width: 10, height: (1/8) * screenHeight)
        temp.center = CGPoint(x: (4/8) * screenWidth + xMasterControl, y: (4.5/8) * screenHeight + yMasterControl)
        stickFigure.append(temp)
        
        //self.view.addSubview(stickFigure[1])
        
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
        //self.view.addSubview(stickFigure[2])
        
        temp =  UIImageView()//Left Arm
        temp.image = UIImage(named: "arm.png")
        temp.frame = CGRect(x: startingPointX, y: startingPointY, width: (0.75/8) * screenHeight, height: 10)
        positionOfLeftArmWhenUp = CGPoint(x: Double(startingPointX) - Double(r) * cos(2.0.squareRoot()/2), y: Double(startingPointY) - Double(r) * sin(2.0.squareRoot() / 2))
        positionOfLeftArmWhenDown = CGPoint(x: Double(startingPointX) - Double(r) * cos(2.0.squareRoot()/2), y: Double(startingPointY) + Double(r) * sin(2.0.squareRoot() / 2))
        temp.center = positionOfLeftArmWhenUp
        temp.transform = CGAffineTransform(rotationAngle: 45*(CGFloat(Double.pi) / 180))
        stickFigure.append(temp)
        //self.view.addSubview(stickFigure[3])
        
        
        startingPointX = (4/8) * screenWidth + xMasterControl
        startingPointY = (5/8) * screenHeight + yMasterControl
        temp =  UIImageView()//Right Leg
        temp.image = UIImage(named: "arm.png")
        temp.frame = CGRect(x: startingPointX, y: startingPointY, width: (0.85/8) * screenHeight, height: 10)
        r = (temp.center.x - startingPointX) / cos(0)
        temp.center = CGPoint(x: Double(startingPointX) + Double(r) * cos(2.0.squareRoot()/2), y: Double(startingPointY) + Double(r) * sin(2.0.squareRoot() / 2))
        temp.transform = CGAffineTransform(rotationAngle: 45*(CGFloat(Double.pi) / 180))
        stickFigure.append(temp)
        //self.view.addSubview(stickFigure[4])
        
        
        temp =  UIImageView()//Left Leg
        temp.image = UIImage(named: "arm.png")
        temp.frame = CGRect(x: startingPointX, y: startingPointY, width: (0.85/8) * screenHeight, height: 10)
        temp.center = CGPoint(x: Double(startingPointX) - Double(r) * cos(2.0.squareRoot()/2), y: Double(startingPointY) + Double(r) * sin(2.0.squareRoot() / 2))
        temp.transform = CGAffineTransform(rotationAngle: -45*(CGFloat(Double.pi) / 180))
        stickFigure.append(temp)
        //self.view.addSubview(stickFigure[5])
        
    }
    func animateStruggle(){
        if(armsCanMove){
            armsCounter += 1
            if(armsCounter == 9) {armsCanMove = false}
            if(armsAreUp){
                UIView.animate(withDuration: 0.25, animations: {() -> Void in
                    self.stickFigure[2].center = self.positionOfRightArmWhenDown
                    self.stickFigure[2].transform = CGAffineTransform(rotationAngle: 45*(CGFloat(Double.pi) / 180))
                    self.stickFigure[3].center = self.positionOfLeftArmWhenDown
                    self.stickFigure[3].transform = CGAffineTransform(rotationAngle: -45*(CGFloat(Double.pi) / 180))
                    
                    self.armsAreUp = false
                }, completion: {(Bool) -> Void in
                    self.animateStruggle()
                })
            }
            else{
                UIView.animate(withDuration: 0.25, animations: {() -> Void in
                    self.stickFigure[2].center = self.positionOfRightArmWhenUp
                    self.stickFigure[2].transform = CGAffineTransform(rotationAngle: -45*(CGFloat(Double.pi) / 180))
                    self.stickFigure[3].center = self.positionOfLeftArmWhenUp
                    self.stickFigure[3].transform = CGAffineTransform(rotationAngle: 45*(CGFloat(Double.pi) / 180))
                    
                    self.armsAreUp = true
                }, completion: {(Bool) -> Void in
                    self.animateStruggle()
                })
            }
        }
    }
    
    private func saveGameState() {
        let data: Data? = NSKeyedArchiver.archivedData(withRootObject: game)
        if fileManager.createFile(atPath: filePath,
                                  contents: data,
                                  attributes: nil) {
          //  //NSLog("File successfully created")
        }
        else {
            //NSLog("Error creating file")
        }
        let dirEnumerator: FileManager.DirectoryEnumerator = fileManager.enumerator(atPath: NSHomeDirectory())!
        var currentPath: String? = dirEnumerator.nextObject() as! String?
        while currentPath != nil {
          //  //NSLog(currentPath!)
            currentPath = dirEnumerator.nextObject() as! String?
        }
    }
    
    private func deleteGameFile() {
        do {
            try fileManager.removeItem(atPath: filePath)
        }
        catch {
            
        }
        let dirEnumerator: FileManager.DirectoryEnumerator = fileManager.enumerator(atPath: NSHomeDirectory())!
        var currentPath: String? = dirEnumerator.nextObject() as! String?
        game.alphebetLetters = []
        while currentPath != nil {
            ////NSLog(currentPath!)
            currentPath = dirEnumerator.nextObject() as! String?
        }
    }
    
    private func restoreGameState() {
        let data: Data? = fileManager.contents(atPath: filePath)
        if data != nil {
            //NSLog("Retrieving data")
            game = (NSKeyedUnarchiver.unarchiveObject(with: data!) as! GameState)
        }
        else {
            //NSLog("No data available")
        }
    }
    
    func displayLetters(_ letters: [LetterView]){
        for letter in letters{
           // //NSLog("\(letter.val) \(letter.removed)")
            if(!letter.removed){
                self.view.addSubview(letter)
            }
        }
    }
    
    func reAddStickFigure(){
        for i in 0..<game.numWrong {
            self.view.addSubview(stickFigure[i])
            self.view.sendSubview(toBack: stickFigure[1])
            self.view.sendSubview(toBack: backgroundImage)
            //self.view.bringSubview(toFront: stickFigure[0])
        }
    }
    
    func addInvisiblePicture(didWin:Bool){
        
        invisibleCover.isUserInteractionEnabled = true
        self.view.addSubview(invisibleCover)
        invisibleCover.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HangManViewController.statsTapped(_:))))
        gameDonePic = UIImageView()
        gameDonePic.removeFromSuperview()
        gameDonePic.frame = CGRect(x: 0, y: 0, width: screenWidth, height: (1/8) * screenHeight)
        gameDonePic.center = CGPoint(x: (4/8) * screenWidth, y: (4/8) * screenHeight)
        tapToContinue.frame = CGRect(x: 0, y: 0, width: (6/8) * screenWidth, height: (0.6/8) * screenWidth)
        tapToContinue.center = CGPoint(x: screenWidth * (4/8), y: (4/8) * screenHeight + (1/8) * screenWidth)
        if(didWin){
            gameDonePic.image = UIImage(named: "youWin.png")
        }
        else{
            gameDonePic.image = UIImage(named: "gameOver.png")
        }
        invisibleCover.addSubview(gameDonePic)
        invisibleCover.addSubview(tapToContinue)
    }
    
    func wordIsSpelt() -> (Bool){
        var result = true
        for Letter in game.currentWordLetters{
            if(Letter.removed){
                result = false
            }
        }
        if(game.currentWord.count == 0)
        {
            result = false
        }
        
        return result
    }
    
    @objc func statsTapped(_ recognizer: UITapGestureRecognizer){
        if(recognizer.state == .ended){
            let svc: StatsViewController = StatsViewController()
            self.present(svc, animated: true, completion: {
                () -> Void in
                self.restartGame()
            })
        }
    }
}
