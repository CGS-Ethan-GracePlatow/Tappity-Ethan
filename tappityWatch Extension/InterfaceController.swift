//
//  InterfaceController.swift
//  tappityWatch Extension
//
//  Created by Ethan Grace-Platow on 2/6/17.
//  Copyright © 2017 Ethan Grace-Platow. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    @IBOutlet weak var scoreLabel: WKInterfaceLabel!
    @IBOutlet weak var timerLabel: WKInterfaceLabel!
    
    var score = 0
    var timer = Timer()
    var counter = 30
    
    @IBAction func buttonTapped(sender: WKInterfaceButton) {
        
        if score < 1 {
            
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(InterfaceController.updateCounter), userInfo: nil, repeats: true)
            
        }
        
        score += 1
        scoreLabel.setText("\(score)")
        
        if counter <= 0 {
            
            timer.invalidate()
            
            let firstAction = WKAlertAction(title: "Dismiss", style: WKAlertActionStyle.default) { () -> Void in
            }
            _ = self.presentAlert(withTitle: "Game Over", message: "Your score was \(score)", preferredStyle: WKAlertControllerStyle.actionSheet, actions: [firstAction])
            
            score = 0
            scoreLabel.setText("\(score)")
            
            counter = 30
            timerLabel.setText("\(30)")
            
        }
        
    }
    
    func updateCounter() {
        
        counter -= 1
        timerLabel.setText("\(counter)")
        
    }
    
}
