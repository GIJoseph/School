//
//  ViewController.swift
//  Hangman
//
//  Created by McVicker, Steven A on 10/17/17.
//  Copyright © 2017 McVicker, Steven A. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
   // wordArray: ["String"]
    var wordsArray: [String] = []
    let game: GameState
    
    init() {
        game = GameState()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "grass.jpeg")
        self.view.insertSubview(backgroundImage, at: 0)
        //read from a file
        let fileURLProject = Bundle.main.path(forResource: "test", ofType: "txt")
        var readStringProject = ""
        do {
            readStringProject = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            
            print("Failed to read")
            print(error)
        }
       
        
         wordsArray = readStringProject.components(separatedBy: "\n")
        
        for word in wordsArray {
            game.words.append(word)
            print(word)
        }
        
        
    

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //self.presentHangManViewController()
        self.presentStartScreenViewController()
    }
    func presentStartScreenViewController(){
        let svc: startScreenViewController = startScreenViewController()
        //svc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(svc, animated: true, completion:{
            () -> Void in
        })
    }
    
    func presentHangManViewController() {
        let dvc: HangManViewController = HangManViewController()
        dvc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(dvc, animated: true, completion: {
            () -> Void in
            dvc.enterNewGame()
        })
    }
    
    func presentStatsViewController() {
        let avc: StatsViewController = StatsViewController()
        avc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(avc, animated: true, completion: {
            () -> Void in
        })
    }

}

