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


//this is what julian demonstrated
//٩(๑❛ᴗ❛๑)۶

class UserManager: ObservableObject {
    
    @Published let mAuth = Auth.auth()
    @Published let firestore = Firestore.firestore()
    @Published let mUser = Auth.auth().currentUser
    
    @Published var isSignedIn = false
    @Published var currentUser: CISUser?
    @State private var username: String = ""
    
func checkIfUserIsSignedIn()
    {
        if FIRAuth.auth()?.currentUser?.uid == nil
        {
            username = "No name"
        }
        else
        {
            let uid = FIRAuth.auth()?.currentUser?.uid
            FIRDatabase.database().reference().child("User").child(uid!).observeSingleEvent(of: .value, with: {(snapshot) in
                let value = snapshot.value as? NSDictionary
                username = value?["Name"]as? String ?? ""

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
    
    func signUp(username: String? = nil, email: String? = nil, password : String? = nil )
    {
        //implement firestore stuff here
        Auth.auth().createUser(withEmail: newEmail, password: newPassword) { results, err in
            //check for error
            if err != nil{
                //There is an error creating the user
                errorMessage = "Error creating user."
            }
            //user created sucessfully
            let db = Firestore.firestore()
            let user = CISUser(username: "name", email: newEmail, bio: "bio")
            
            db.collection("users").document(user.id).set(user){
                (error) in
                if error != nil{
                    //Show error message
                    errorMessage = "Error saving data. Please contact admin."
                }
            }
            
        }
    }
    
    func signOut()
    {
        // currentUser = nil
        // isSignedIn = false
        // Firebase.auth.signOut()
    }
}
