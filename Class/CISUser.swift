//
//  CISUser.swift
//  CIS Friender
//
//  Created by Kiki on 27/2/2022.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Tags {
  
}

struct CISUser: Identifiable, Codable{
    //this will randomly generate a UUID
    @DocumentID var id = UUID().uuidString
    var username: String
    var email : String
    var bio : String
    var imageName: String
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
    
    //There's no hashmap in swift
    // (ఠ్ఠ ˓̭ ఠ్ఠ)
    var Preferences  = [
        //String : String
        "one" : "",
    ]
    
    //this is an array
    var tags: [String] = []
    
    //initializing my variables
    init(username: String, email: String, bio:String, imageName: String) {
        self.username = username
        self.email = email
        self.bio = bio
        self.imageName = imageName
   }
    
    static var data: [CISUser] {
        [
            CISUser(username: "Keona", email:"keonal2023@student.cis.edu.hk", bio: "self-proclaimed introvert", imageName: "keona1"),
            CISUser(username: "Keona", email:"keonal2023@student.cis.edu.hk", bio: "self-proclaimed introvert", imageName: "keona2"),
            CISUser(username: "Keona", email:"keonal2023@student.cis.edu.hk", bio: "self-proclaimed introvert", imageName: "keona3"),
            CISUser(username: "Kirsten", email:"keonal2023@student.cis.edu.hk", bio: "i write poems", imageName: "kirsten"),
            CISUser(username: "Charlie", email:"keonal2023@student.cis.edu.hk", bio: "i love baking", imageName: "charlie"),
            CISUser(username: "Shirley", email:"keonal2023@student.cis.edu.hk", bio: "no.", imageName: "shirley"),
            CISUser(username: "Rachel", email:"keonal2023@student.cis.edu.hk", bio: "fun times", imageName: "rachel")
            
        ]
    }
    
    //U dont need getters, setters and toString() for swift, java sucks!
    //⋋_⋌

//How to create a cisuser object?
////(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧
//    var keona = CISUser(username: "Keona", email:keonal2023@student.cis.edu.hk, bio:"woo", imageName: "keona")


//Struct is similar to class, it is something INSIDE the class
//var tags = Tags()
}

