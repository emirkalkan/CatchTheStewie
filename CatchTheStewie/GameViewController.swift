//
//  GameViewController.swift
//  CatchTheStewie
//
//  Created by Emir Kalkan on 18.11.2019.
//  Copyright © 2019 Emir Kalkan. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    //Variables
    var score = 0
    var timer = Timer()
    var counter = 0
    var stewieArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    
    //Views
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var stewie1: UIImageView!
    @IBOutlet weak var stewie2: UIImageView!
    @IBOutlet weak var stewie3: UIImageView!
    @IBOutlet weak var stewie4: UIImageView!
    @IBOutlet weak var stewie5: UIImageView!
    @IBOutlet weak var stewie6: UIImageView!
    @IBOutlet weak var stewie7: UIImageView!
    @IBOutlet weak var stewie8: UIImageView!
    @IBOutlet weak var stewie9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "Score: \(score)"
        
        //Highscore check
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        //Images
        stewie1.isUserInteractionEnabled = true
        stewie2.isUserInteractionEnabled = true
        stewie3.isUserInteractionEnabled = true
        stewie4.isUserInteractionEnabled = true
        stewie5.isUserInteractionEnabled = true
        stewie6.isUserInteractionEnabled = true
        stewie7.isUserInteractionEnabled = true
        stewie8.isUserInteractionEnabled = true
        stewie9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore ))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore ))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore ))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore ))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore ))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore ))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore ))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore ))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore ))
        
        stewie1.addGestureRecognizer(recognizer1)
        stewie2.addGestureRecognizer(recognizer2)
        stewie3.addGestureRecognizer(recognizer3)
        stewie4.addGestureRecognizer(recognizer4)
        stewie5.addGestureRecognizer(recognizer5)
        stewie6.addGestureRecognizer(recognizer6)
        stewie7.addGestureRecognizer(recognizer7)
        stewie8.addGestureRecognizer(recognizer8)
        stewie9.addGestureRecognizer(recognizer9)
        
        stewieArray = [stewie1, stewie2, stewie3, stewie4, stewie5, stewie6, stewie7, stewie8, stewie9]
        
        //timer
        counter = 10
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideStewie), userInfo: nil, repeats: true)
    }
    
    @objc func hideStewie () {
        for stewie in stewieArray {
            stewie.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(UInt(stewieArray.count - 1))))
        let random2 = Int(arc4random_uniform(UInt32(UInt(stewieArray.count - 1))))
        let random3 = Int(arc4random_uniform(UInt32(UInt(stewieArray.count - 1))))
        stewieArray[random].isHidden = false;
        stewieArray[random2].isHidden = false;
        stewieArray[random3].isHidden = false;
    }


    @objc func  increaseScore () {
        score += 1
        scoreLabel.text = "Score: \(score )"
    }
    
    @objc func countDown() {
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for stewie in stewieArray {
                stewie.isHidden = true
            }
            
            //HighScore
            
            if self.score > self.highScore {
                self.highScore = self.score
                highScoreLabel.text = " Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highScore")
            }
            
            //Alert
            
            let alert = UIAlertController(title: "Time is up.", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let backButton = UIAlertAction(title: "Back", style: UIAlertAction.Style.cancel) {
                (UIAlertAction) in
                //back action
                self.navigationController?.popViewController(animated: true)
               
            }
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                //replay action
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideStewie), userInfo: nil, repeats: true)
                
            }
            
            alert.addAction(backButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
    }

}
