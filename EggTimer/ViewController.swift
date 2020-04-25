//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard":720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {

        totalTime = eggTimes[sender.currentTitle!]!
        progressBar.progress = 0;
        
        timer.invalidate()
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true)
        
    }
    
    @objc func updateTimer(){
        progressBar.progress = Float(secondsPassed) / Float(totalTime)
        if(secondsPassed < totalTime){
            secondsPassed += 1
        } else {
            timer.invalidate()
            titleLabel.text = "Done"
        }
        
    }
    
    
}
