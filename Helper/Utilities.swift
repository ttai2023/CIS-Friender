//
//  Utilities.swift
//  CIS Friender
//
//  Created by Kiki on 3/3/2022.
//

import Foundation
import UIKit

class Utilities{
    
    //This is a function that checks whether your password is valid or not
    //(,,Ծ‸Ծ,, )
    static func isPasswordValid(password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")
        return passwordTest.evaluate(with: password)
    }
}

