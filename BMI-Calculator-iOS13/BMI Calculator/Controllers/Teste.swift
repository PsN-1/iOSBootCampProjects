//
//  Teste.swift
//  BMI Calculator
//
//  Created by Pedro Neto on 08/08/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation



struct Calc {
    
    mutating func calculate(height: Float, weight: Float) -> Float {
        
        return weight / (height * height)
    }
    
}
