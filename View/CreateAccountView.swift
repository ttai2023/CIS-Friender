//
//  CreateAccountView.swift
//  CIS Friender
//
//  Created by Terri Tai on 15/2/2022.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct CreateAccountView: View
{
    @State private var newUsername: String = ""
    @State private var newEmail: String = ""
    @State private var newPassword: String = ""
    @State private var invalidInput = false
    @State private var errorMessage = ""
    
    var body: some View
    {
        VStack(alignment: .center, spacing: 10.0)
        {
            Text("Creating A New Account")
                .font(.system(size: 33, weight: .bold))
                .foregroundColor(lightBlue)
                .multilineTextAlignment(.center)
            Image("Boy 1")
                .resizable()
            //so image can be resized
                .aspectRatio(contentMode: .fill)
            //prevents original photo to be distorted
                .frame(width: 150, height: 150)
            
            
            TextField("Username: " , text: $newUsername)
                .padding(.horizontal, 10.0)
                .background(lightGrey)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            TextField("Email: " , text: $newEmail)
                .padding(.horizontal, 10.0)
                .background(lightGrey)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            TextField("password: " , text: $newPassword)
                .padding(.horizontal, 10.0)
                .background(lightGrey)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            Button("Sign Up") {
                
            }
            
            Label("Error", systemImage: "cross.fill")
            if errorMessage.isEmpty {
                Label(errorMessage,systemImage: "cross.fill")
            }
            
            Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Picker")) {
                Text("Pick your zodiac").tag(1)
                Text("Capricorn").tag(2)
                Text("Virgo").tag(3)
                Text("Cancer").tag(4)
                Text("Taurus").tag(5)
                Text("Libra").tag(6)
            }
            Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Picker")) {
                Text("Pick your MBTI").tag(1)
                Text("ISTJ").tag(2)
                Text("INFJ").tag(3)
                Text("ESFJ").tag(4)
                Text("ISTP").tag(5)
                
            }
        }
        .padding(5.0)
    }
    
    //This is a method to check the fields. If everything is correct, it returns nil.
    //Otherwise returns error message.-`д´-
    
    func validateFields()-> String?{
        //Make sure fields aint empty
        if newUsername.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            newPassword.trimmingCharacters(in: .whitespacesAndNewlines)==""{
            return "Please fill in all the fields"
        }
        //check if password is valid, use the method from utilities
        let cleanedPassword = newPassword.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(password: cleanedPassword) == false{
            //password aint secure
            return "Please make sure your password is at least 8 characters that contains a special character and a number ಠ_ಠ"
        }
        
        return nil
    }
    
    func tappedSignup(sender : Any){
        //validate the fields
        let error = validateFields()
        
        if error != nil{
            //Something is wrong with fields...
            return invalidInput = true
        }
        else{
            //and create the user
            Auth.auth().createUser(withEmail: newEmail, password: newPassword) {results, err in
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
        
        //Transition to the home screen
                    transitionToMain()
    }
    
}


func transitionToMain(){
    NavigationLink(LocalizedStringKey) {
                    MainView()
                }
}


struct CreateAccountView_Previews: PreviewProvider
{
    static var previews: some View {
        CreateAccountView()
    }
}
