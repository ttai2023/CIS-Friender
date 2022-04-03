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
    @EnvironmentObject private var userManager: UserManager
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
                .foregroundColor(Constants.lightBlue)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
                .lineLimit(2)
            Image("Boy 1")
                .resizable()
            //so image can be resized
                .aspectRatio(contentMode: .fill)
            //prevents original photo to be distorted
                .frame(width: 150, height: 150)
                .padding(.bottom, 20)
            
            TextField("Username" , text: $newUsername)
                .padding()
                .background(Constants.lightGrey)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            TextField("Email" , text: $newEmail)
                .padding()
                .background(Constants.lightGrey)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            SecureField("Password" , text: $newPassword)
                .padding()
                .background(Constants.lightGrey)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            Button("Sign Up") {
                signUp()
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
        //shape of the button
            .frame(width: 220, height: 50)
            .background(Constants.blue)
            .cornerRadius(15.0)
            .padding(.bottom, 20)
            
            if !errorMessage.isEmpty {
                Label(errorMessage,systemImage: "exclamationmark.triangle.fill")
                    .foregroundColor(Color.red)
            }
        }
        .padding()
        .navigationBarTitle("", displayMode: .inline)
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
    
    //TODO: NO duplicate sign up

    func signUp(){
       
        //validate the fields
        let error = validateFields()
    
        if let error = error {
       
            //Something is wrong with fields...
            errorMessage = error
        }
        else{
            //and create the user
            userManager.signUp(username: newUsername, email: newEmail, password: newPassword)
            
        }
    }
    
}

struct CreateAccountView_Previews: PreviewProvider
{
    static var previews: some View {
        CreateAccountView()
    }
}
