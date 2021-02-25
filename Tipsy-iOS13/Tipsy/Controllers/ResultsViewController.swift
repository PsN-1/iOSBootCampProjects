//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Pedro Neto on 09/08/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    


    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var calcResult = "0.0"
    var tip: String = "10%"
    var split: Double = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = "$ \(calcResult)"
        settingsLabel.text = "Split between \(Int(split)) people, with \(tip) tip."

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
