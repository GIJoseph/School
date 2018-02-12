//
//  StatsViewController.swift
//  Hangman
//
//  Created by McVicker, Steven A on 11/23/17.
//  Copyright © 2017 McVicker, Steven A. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    var game: GameState
    
    var statLogo: UIImageView
    
    var wordLabel: UILabel
    //var word: UILabel
    
    var correctGuessesLabel: UILabel
    //var correctGuesses: UILabel
    
    var incorrectGuessesLabel: UILabel
    //var incorrectGuesses: UILabel
    
    var winLabel: UILabel
    //var win: UILabel
    
    var numOfGuessesLabel: UILabel
    //var numOfGuesses: UILabel
    
    let fileManager: FileManager = FileManager.default
    let filePath: String = "\(NSHomeDirectory())/tmp/hangman.txt"
    
    
    var newGameButton: UIImageView
    init()
    {
        game = GameState()
        statLogo = UIImageView()
        statLogo.image = UIImage(named: "stats")
        statLogo.frame = CGRect(x: (0.5/8) * screenWidth, y: (0.3/8) * screenHeight, width: (7/8) * screenWidth, height: (1.5/8) * screenHeight)
        
        wordLabel = UILabel()
        //wordLabel.text = "The word is:"
        //word = UILabel()
        //word.text = game.currentWord
        
        winLabel = UILabel()
        //winLabel.text = "Did you win?"
        //win = UILabel()
        //win.text = "yes/no"
        
        numOfGuessesLabel = UILabel()
        //numOfGuessesLabel.text = "How many total guesses did you make?"
        //numOfGuesses = UILabel()
        //numOfGuesses.text = "get num of guesses"
        
        correctGuessesLabel = UILabel()
        //correctGuessesLabel.text = "How many letters did you guess correctly?"
        //correctGuesses = UILabel()
        //correctGuesses.text = "# of correct guesses"
        
        incorrectGuessesLabel = UILabel()
        //incorrectGuessesLabel.text = "How many letters did you guess incorrectly?"
        //incorrectGuesses = UILabel()
        //incorrectGuesses.text = "# of incorrect guesses"
        
        
        newGameButton = UIImageView()
        newGameButton.image = UIImage(named: "startNewGame.png")
        newGameButton.frame = CGRect(x: (1.5/8) * screenWidth, y: (6.5/8) * screenHeight, width: (4/8) * screenWidth, height: (0.75/8) * screenHeight)
        newGameButton.center = CGPoint(x: (4/8) * screenWidth, y: (7.5/8) * screenHeight)
        newGameButton.isUserInteractionEnabled = true
        
        
        super.init(nibName: nil, bundle: nil)
        
        restoreGameState()
        
        wordLabel.frame = CGRect(x: 20, y: screenHeight * (2/8), width: screenWidth, height: 50)
        wordLabel.text = "The word is: " + game.currentWord
        //word.frame = CGRect(x: 20, y: screenHeight * (2.3/8), width: screenWidth, height: 50)
        
        var winText = "You have not won"
        if (wordIsSpelt()){
            winText = "You Won"
        }
        winLabel.frame = CGRect(x: 20, y: screenHeight * (3/8), width: screenWidth, height: 50)
        winLabel.text = winText
        //win.frame = CGRect(x: 20, y: screenHeight * (3.3/8), width: screenWidth, height: 50)
        
        numOfGuessesLabel.frame = CGRect(x: 20, y: screenHeight * (4/8), width: screenWidth, height: 50)
        numOfGuessesLabel.text = "You made \(numberOfGuesses()) total guesses"
        //numOfGuesses.frame = CGRect(x: 20, y: screenHeight * (4.3/8), width: screenWidth, height: 50)
        
        correctGuessesLabel.frame = CGRect(x: 20, y: screenHeight * (5/8), width: screenWidth, height: 50)
        correctGuessesLabel.text = "You have guessed \(numberOfGuesses() - game.numWrong) correctly"
        //correctGuesses.frame = CGRect(x: 20, y: screenHeight * (5.3/8), width: screenWidth, height: 50)
        
        incorrectGuessesLabel.frame = CGRect(x: 20, y: screenHeight * (6/8), width: screenWidth, height: 50)
        incorrectGuessesLabel.text = "You have guessed \(game.numWrong) incorrectly"
        //incorrectGuesses.frame = CGRect(x: 20, y: screenHeight * (6.3/8), width: screenWidth, height: 50)
        
        self.view.backgroundColor = UIColor.lightGray
        self.view.addSubview(statLogo)
        self.view.addSubview(wordLabel)
        //self.view.addSubview(word)
        self.view.addSubview(winLabel)
        //self.view.addSubview(win)
        self.view.addSubview(numOfGuessesLabel)
        //self.view.addSubview(numOfGuesses)
        self.view.addSubview(correctGuessesLabel)
        //self.view.addSubview(correctGuesses)
        self.view.addSubview(incorrectGuessesLabel)
        //self.view.addSubview(incorrectGuesses)
        self.view.addSubview(newGameButton)
        
        let invisibleCover = UIImageView()
        invisibleCover.image = UIImage(named: "invisiblePixel.png")
        invisibleCover.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        invisibleCover.isUserInteractionEnabled = true
        //self.view.addSubview(invisibleCover)
        //invisibleCover.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(StatsViewController.screenTapped(_:))))
        
        newGameButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(StatsViewController.screenTapped(_:))))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    
    
    @objc func startTapped(_ recognizer: UITapGestureRecognizer){
        if(recognizer.state == .ended){
            let dvc: HangManViewController = HangManViewController()
            dvc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(dvc, animated: true, completion: {
                () -> Void in
                self.deleteGameFile()
                dvc.enterNewGame()
            })
        }
    }
 
    @objc func screenTapped(_ recognizer: UITapGestureRecognizer){
        if(recognizer.state == .ended){
            self.presentingViewController?.dismiss(animated: true, completion: { () -> Void in
                NSLog("Dismissing stats page")
            })
        }
    }
    private func restoreGameState() {
        let data: Data? = fileManager.contents(atPath: filePath)
        if data != nil {
            NSLog("Retrieving data")
            game = (NSKeyedUnarchiver.unarchiveObject(with: data!) as! GameState)
        }
        else {
            NSLog("No data available")
        }
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
    
    func numberOfGuesses() -> Int{
        var num = 0
        for Letter in game.alphebetLetters{
            if(Letter.removed){
                num += 1
            }
        }
        return num
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
            NSLog(currentPath!)
            currentPath = dirEnumerator.nextObject() as! String?
        }
    }
}
