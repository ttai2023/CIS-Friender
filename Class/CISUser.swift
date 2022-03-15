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

//struct CISUser: Identifiable, Codable {
//
//}

struct CISUser: Identifiable, Codable{
    //this will randomly generate a UUID
    @DocumentID var id = UUID().uuidString
    var username: String
    var email : String
    var bio : String
    var imageName: String
    var zodiac: String
    var MBTI: String
    var talent: String
    
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
    init(username: String, email: String, bio: String, imageName: String, zodiac: String, MBTI: String, talent: String) {
        self.username = username
        self.email = email
        self.bio = bio
        self.imageName = imageName
        self.zodiac = zodiac
        self.MBTI = MBTI
        self.talent = talent
   }
    
    static var data: [CISUser] {
        [
<<<<<<< HEAD
            CISUser(username: "Keona", email:"keonal2023@student.cis.edu.hk", bio: "self-proclaimed introvert", imageName: "keona1", zodiac: "zodiac", MBTI: "MBTI", talent: "talent"),
            CISUser(username: "Keona", email:"keonal2023@student.cis.edu.hk", bio: "self-proclaimed introvert", imageName: "keona2", zodiac: "zodiac", MBTI: "MBTI", talent: "talent"),
            CISUser(username: "Keona", email:"keonal2023@student.cis.edu.hk", bio: "self-proclaimed introvert", imageName: "keona3", zodiac: "zodiac", MBTI: "MBTI", talent: "talent"),
            CISUser(username: "Kirsten", email:"keonal2023@student.cis.edu.hk", bio: "i write poems", imageName: "kirsten", zodiac: "zodiac", MBTI: "MBTI", talent: "talent"),
            CISUser(username: "Charlie", email:"keonal2023@student.cis.edu.hk", bio: "i love baking", imageName: "charlie", zodiac: "zodiac", MBTI: "MBTI", talent: "talent"),
            CISUser(username: "Rachel", email:"keonal2023@student.cis.edu.hk", bio: "fun times", imageName: "rachel", zodiac: "zodiac", MBTI: "MBTI", talent: "talent")
            
=======
//            Firestore.firestore().collection("User")
//                .getDocuments() { (querySnapshot, err) in
//                    //catch error
//                    if let err = err {
//                        print("Error getting users: \(err)")
//                    }
//                    else {
//                          for document in querySnapshot!.documents {
//                              //try? -> self.user will be nil, try! -> app will crash
//                              //convert document into CISUser object
//                              self.user = try? document.data(as: CISUser.self)
//                              //loop through each tag in tags Array in current user
//                          }
//                    }
//                }
            CISUser(username: "Keona", email:"keonal2023@student.cis.edu.hk", bio: "self-proclaimed introvert", imageName: "Boy 1"),
            CISUser(username: "Keona", email:"keonal2023@student.cis.edu.hk", bio: "self-proclaimed introvert", imageName: "keona2"),
            CISUser(username: "Keona", email:"keonal2023@student.cis.edu.hk", bio: "self-proclaimed introvert", imageName: "keona3"),
            CISUser(username: "Kirsten", email:"keonal2023@student.cis.edu.hk", bio: "i write poems", imageName: "kirsten"),
            CISUser(username: "Charlie", email:"keonal2023@student.cis.edu.hk", bio: "i love baking", imageName: "charlie"),
            CISUser(username: "Rachel", email:"keonal2023@student.cis.edu.hk", bio: "fun times", imageName: "rachel")
>>>>>>> 65bd1de187cb6ee37ba3d5230bf5311289fff1ef
        ]
                    
    }
    
    func getUsers() {
//        //fetch all users from firebase
//        Firestore.firestore().collection("User")
//            .getDocuments() { (querySnapshot, err) in
//                //catch error
//                if let err = err {
//                    print("Error getting users: \(err)")
//                }
//                else {
//                      for document in querySnapshot!.documents {
//                          //try? -> self.user will be nil, try! -> app will crash
//                          //convert document into CISUser object
//                          self.user = try? document.data(as: CISUser.self)
//                          //loop through each tag in tags Array in current user
//                          if let user = self.user {
//                              continue
//                          }
//                      }
//                }
//        }
    }
    
//U dont need getters, setters and toString() for swift, java sucks!
//⋋_⋌

//How to create a cisuser object?
////(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧
//    var keona = CISUser(username: "Keona", email:keonal2023@student.cis.edu.hk, bio:"woo", imageName: "keona")


//Struct is similar to class, it is something INSIDE the class
//var tags = Tags()
}

