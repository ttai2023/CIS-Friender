//
//  UserManager.swift
//  CIS Friender
//
//  Created by Kiki on 4/3/2022.
//

import Foundation
import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseDatabase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseFirestoreCombineSwift

//this is what julian demonstrated
//٩(๑❛ᴗ❛๑)۶

class UserManager: ObservableObject {
    
    @Published var mAuth = Auth.auth()
    @Published var firestore = Firestore.firestore()
    @Published var mUser = Auth.auth().currentUser
    
    @Published var isSignedIn = false
    @Published var currentUser: CISUser?
    @Published var errorMessage: String? = nil
    @Published private var username: String = ""
    
    //whenever someone signs up/sign in -> set currentUser
    
//follow updated tutorial
func checkIfUserIsSignedIn()
    {
        if mAuth.currentUser?.uid == nil
        {
            username = "No name"
        }
        else
        {
            let uid = mAuth.currentUser?.uid
            Database.database().reference().child("User").child(uid!).observeSingleEvent(of: .value, with: {(snapshot) in
                let value = snapshot.value as? NSDictionary
                self.username = value?["Name"]as? String ?? ""

            })
        }
    }
    func signIn(useremail: String? = nil, password: String? = nil)
    {
        // firerbase authenticate w username and password
        
        // load current user
        // currentUser = firebase.currentUser
        
        // over here,
      
        isSignedIn = true
        
    }
    
    func signUp(username: String, email: String, password : String)
    {
        //implement firestore stuff here
        mAuth.createUser(withEmail: email, password: password) { results, err in
            //check for error
            if err != nil{
                //There is an error creating the user
                self.errorMessage = "Error creating user."
            }
            //user created sucessfully
            let db = Firestore.firestore()
            let user = CISUser(username: "name", email: email, bio: "bio")
            do {
                try db.collection("users").document(user.id!).setData(from: user)
            }
            catch {
                // error is already not nil so no need to check if it’s != nil
                    //Show error message
                self.errorMessage = "Error saving data. Please contact admin."
            }
            self.isSignedIn = true
        }
            
    }
    
    func signOut()
    {
        // currentUser = nil
        // isSignedIn = false
        // Firebase.auth.signOut()
    }
}
