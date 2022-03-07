//
//  CISUser.swift
//  CIS Friender
//
//  Created by Kiki on 27/2/2022.
//

import Foundation
import UIKit
import FirebaseFirestoreSwift

struct Tags {
  
}

struct CISUser: Identifiable, Codable{
    //this will randomly generate a UUID
    @DocumentID var id = UUID().uuidString
    var username: String
    var email : String
    var bio : String
    
    //There's no hashmap in swift
    // (ఠ్ఠ ˓̭ ఠ్ఠ)
    var Preferences  = [
        //String : String
        "one" : "",
    ]
    
    //this is an array
    var tags: [String] = []
    
    //initializing my variables
    init(username: String, email: String, bio:String) {
        self.username = username
        self.email = email
        self.bio = bio
       }
    
    //U dont need getters, setters and toString() for swift, java sucks!
    //⋋_⋌
    }

//How to create a cisuser object?
////(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧
var keona = CISUser(username: "Keona", email:"keonal2023@student.cis.edu.hk", bio:"woo")


//Struct is similar to class, it is something INSIDE the class
var tags = Tags()
