//
//  AnotherFile.swift
//  SwiftAccessLevels
//
//  Created by Angela Yu on 14/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class AnotherClassInAnotherFile {
//    let aClass = AClass()
    init() {
        
 
        
        //Step 10. Try to print anInternalProperty Here - Possible
        print("\(aClass.anInternalProperty) printed from AnotherClassInAnotherFile")
        //Step 8. Try to print aFilePrivateProperty Here - Not Possible
//        print("\(aClass.aFilePrivateProperty) printed from AnotherClassInTheSameFile")
        
    }
    
}
