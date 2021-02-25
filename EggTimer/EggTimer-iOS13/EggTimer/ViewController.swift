//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var prgsBar: UIProgressView!
    @IBOutlet weak var doneView: UILabel!
    
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 10]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0

    @IBAction func btn(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        doneView.text = "How do you like your eggs?"
        timer.invalidate()
        totalTime = eggTimes[hardness]!
        prgsBar.progress = 0.0
        secondsPassed = 0
        doneView.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            prgsBar.setProgress(Float(secondsPassed) / Float(totalTime), animated: true)
            print(Float(secondsPassed) / Float(totalTime))



        } else {
            timer.invalidate()
            doneView.text = "Done!"
            playSound()

        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
