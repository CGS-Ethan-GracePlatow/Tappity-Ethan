//
//  ViewController.swift
//  Tappity
//
//  Created by Ethan Grace-Platow on 30/5/17.
//  Copyright © 2017 Ethan Grace-Platow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
        
    var score = 0
    var timer = Timer()
    var counter = 30
    
    @IBAction func buttonTapped(sender: UIButton) {
        
        if score < 1 {
            
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
            
        }
        
        score += 1
        scoreLabel.text = "\(score)"
        
        if counter <= 0 {
            
            timer.invalidate()
            
            let alert = UIAlertController(title: "Game Over", message: "Your score was \(self.score)", preferredStyle: UIAlertControllerStyle.actionSheet)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            score = 0
            
        }
        
    }
    
    func updateCounter() {
        
        counter -= 1
        timerLabel.text = "\(counter)"
        
    }
    
}

