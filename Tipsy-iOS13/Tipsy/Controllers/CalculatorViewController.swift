//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipValue = "10%"
    var numberPeople: Double = 2
    var result = ""
    var prt: Double  = 0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true) // Dismiss the keyboard after tapping the button
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        tipValue = sender.self.currentTitle!
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberPeople = Double(sender.value)
    }
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
    
        prt = (Double(tipValue.dropLast()) ?? 10) / 100

        var textfield = 0.0
        if Double(billTextField.text!) != nil {
             textfield = Double(billTextField.text!)!
        } else {
             textfield = 123.56
        }
        

        result = String(format: "%.2f", (textfield * (1 + prt) / numberPeople))
 
        self.performSegue(withIdentifier: "goToResult", sender: self)
        print("result \(result)")
        print("prt \(prt)")
        print("numberPeople \(numberPeople)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            
            let destinationVc = segue.destination as! ResultsViewController
            destinationVc.calcResult = result
            destinationVc.tip = tipValue
            destinationVc.split = numberPeople
            
        }
    }
}

