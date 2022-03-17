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
    @Published var mUserID : String = ""
    @Published var isSignedIn = false
    @Published var currentUser: CISUser?
    @Published var errorMessage: String = ""
    @Published private var username: String = ""
    @Published var userMBTI: String = ""
    
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
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: {(snapshot) in
                let value = snapshot.value as? NSDictionary
                self.username = value?["Name"]as? String ?? ""

            })
        }
    }
    
    
    func signIn(email: String, password: String)
    {
        // firerbase authenticate w username and password
        mAuth.signIn(withEmail: email, password: password) { results, err in
            // check for error
            if err != nil
            {
                //There is an error creating the user
                self.errorMessage = "Error signing in."
            }
            else
            {
                self.mUserID = results!.user.uid
                self.fetchCurUserData()
                self.isSignedIn = true
                
            }

        }
        
    }
    
    func signUp(username: String, email: String, password: String)
    {
        //implement firestore stuff here
        mAuth.createUser(withEmail: email, password: password) { results, err in
            //check for error
            if err != nil{
                //There is an error creating the user
                self.errorMessage = "Error creating user."
            }
            //user created sucessfully
            let user = CISUser(username: username, email: email, bio: "bio", imageName: "girl1", zodiac: "zodiac", MBTI: "MBTI", talent: "talent")
            do {
                try self.firestore.collection("users").document(user.id!).setData(from: user)
            }
            catch {
                // error is already not nil so no need to check if it’s != nil
                    //Show error message
                self.errorMessage = "Error saving data. Please contact admin."
            }
            self.isSignedIn = true
            self.mUserID = user.id!
            self.fetchCurUserData()
        }
            
    }
    
    func fetchCurUserData(){
        let db = Firestore.firestore()
        
        let docRef = db.collection("users").document(mUserID)
        
        docRef.getDocument{(document, error) in
            guard error == nil else
            {
                print("error", error ?? "")
                return
            }
            
            if let document = document, document.exists
            {
                if let docUser = try? document.data(as: CISUser.self) {
                    self.currentUser = docUser
                    self.mUserID = docUser.id!
                }
                else {
                    print("no")
                }
            }
        }
    }
    
    func signOut()
    {
        currentUser = nil
        isSignedIn = false
        do{
            try mAuth.signOut()
        }
        catch {
            self.errorMessage = "Error signing out. Please contact admin."
        }
    }
    
    //TODO: RESET PASSWORD FUNCTION
//    func resetPassword()
//    {
//        mAuth.sendPasswordReset(withEmail: emailField.text!) { Error? in
//            do{
//
//            }
//            catch{
//                self.errorMessage = "Error resetting password.(´･_･`)"
//            }
//        }
//    }
    
}


