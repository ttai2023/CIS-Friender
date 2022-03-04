//
//  UserManager.swift
//  CIS Friender
//
//  Created by Kiki on 4/3/2022.
//

import Foundation
import SwiftUI

//this is what julian demonstrated
//٩(๑❛ᴗ❛๑)۶

class UserManager: ObservableObject {
    @Published var isSignedIn = false
//    @Published var currentUser: CISUser?
    
    func signIn(username: String? = nil, password: String? = nil) {
        // firerbase authenticate w username and password
        // over here
        
        // load current user
        // currentUser = firebase.currentUser
        
        // over here,
        // isSignedIn = true
    }
    
    func signUp(username: String? = nil, email: String? = nil, password : string? = nil ){
        //implement firestore stuff here
    }
    
    func signOut() {
        // currentUser = nil
        // isSignedIn = false
        // Firebase.auth.signOut()
    }
}
