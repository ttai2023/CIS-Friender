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
            Database.database().reference().child("Users").child(uid!).observeSingleEvent(of: .value, with: {(snapshot) in
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
                self.mUserID = (self.mUser?.uid)!
                self.fetchCurUserData()
            }
            
//            firestore.collection("users").document(self.mUser.uid) {snapshot, error in
//                if let error
//                    error {
//                        return ("Failed to fetch current user:", error)
//                    }
//                guard let data = snapshot?.data() else { return }
        }
        
        // load current user
        
        
//        let docRef = firestore.collection("Users").document(userID)

//        docRef.getDocument(as: CISUser.self) { result in
//            // The Result type encapsulates deserialization errors or
//            // successful deserialization, and can be handled as follows:
//            //
//            //      Result
//            //        /\
//            //   Error  CISUser
//            switch result
//            {
//                case .success(let user):
//                    // A `CISUser` value was successfully initialized from the DocumentSnapshot.
//                self.currentUser = user
//                case .failure(let error):
//                    // A `CISUser` value could not be initialized from the DocumentSnapshot.
//                self.errorMessage = "Error getting user."
//            }
//        }
         
        // over here
        self.isSignedIn = true
        
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
//            do {
//                try self.firestore.collection("Users").document(user.id!).setData(from: user)
//            }
//            catch {
//                // error is already not nil so no need to check if it’s != nil
//                    //Show error message
//                self.errorMessage = "Error saving data. Please contact admin."
//            }
            self.isSignedIn = true
            self.fetchCurUserData()
        }
            
    }
    
    func fetchCurUserData(){
        let db = Firestore.firestore()
        
        let docRef = db.collection("Users").document(mUserID)
        
        docRef.getDocument{(document, error) in
            guard error == nil else
            {
                print("error", error ?? "")
                return
            }
            
            if let document = document, document.exists
            {
                let data = document.data()
                if let data = data
                {
                    print("data", data)
                    self.userMBTI = data["MBTI"]as? String??""
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


