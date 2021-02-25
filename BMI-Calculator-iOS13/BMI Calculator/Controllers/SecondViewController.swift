//
//  secondViewController.swift
//  BMI Calculator
//
//  Created by Pedro Neto on 08/08/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = bmiValue
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50) // Core Graphic Rectangle
        view.addSubview(label)
    }
}
