//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        //sender is the button
        //titleLabel return the name of the view that's been tapped
//        sender.alpha = 0.5
//        UIView.animate(withDuration: 0.2) {
//            sender.alpha = 1.0
//        }
        
        sender.alpha = 0.5
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }

        playSound(sender.currentTitle!)
//        sender.alpha = 0.5

    }
    
    func playSound(_ btn: String) {
        
        let url = Bundle.main.url(forResource: btn, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
    


