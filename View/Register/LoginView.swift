//
//  LoginView.swift
//  CIS Friender
//
//  Created by Terri Tai on 16/2/2022.
//

import SwiftUI
import Firebase

struct LoginView: View
{
    @State var email: String = ""
    @State var password: String = ""
    @State var invalidInput = false
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View
    {
        //stack stuff on top of each other vertically
        VStack
        {
            Spacer()
                .frame(height: 50)
            welcomeText
            Image("keona")
                .resizable() //so image can be resized
                .aspectRatio(contentMode: .fill) //prevents original photo to be distorted
                .frame(width: 150, height: 150)//frame of circle
                .clipped() //area outside of frame will be cut
                .cornerRadius(100)
                .padding(.bottom, 10)
            TextField("Email: " , text: $email)
                .padding()
                .background(Constants.lightGrey)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            //SecureField --> changes content to dots after inputted
            SecureField("Password: ", text: $password)
                .padding()
                .background(Constants.lightGrey)
                .cornerRadius(5.0)
                .padding(.bottom, 15)
            
            // Login button
            
            // for the button, add
            
            Button
            {
                signIn()
                userManager.signIn(email: email, password: password)
                
            } label: {
                Text("LOGIN")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                //shape of the button
                    .frame(width: 220, height: 50)
                    .background(Constants.blue)
                    .cornerRadius(15.0)
                    .padding(.bottom, 10)
            }
            
            NavigationLink ( destination: ForgotPasswordView() ){
                    Text("Forgot Password?")
                        }
            .foregroundColor(Constants.darkBlue)
            .navigationBarHidden(true)
            
            
            Spacer()
            
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(Constants.blue)
                NavigationLink(destination: CreateAccountView())
                {
                   Text("Sign Up")
                }
            }
            .foregroundColor(Constants.darkBlue)
           
        }
        //adds padding around the whole stack
        .padding()
        .navigationBarHidden(true)
    }
    
    var welcomeText: some View
    {
        return Text("Welcome to Friender!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
            .foregroundColor(Constants.darkBlue)
    }

    
    func validateFields() -> String?
    {
        //Make sure fields aint empty
        if email.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password.trimmingCharacters(in: .whitespacesAndNewlines)==""
        {
            return "Please fill in all the fields"
        }
        //check if password is valid, use the method from utilities
        let cleanedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return nil
    }
    
    func signIn()
    {
        //validate the fields
        let error = validateFields()
        
        if error != nil{
            //Something is wrong with fields...
            return invalidInput = true
        }
        else {
            // sign in
            userManager.signIn(email: email, password: password)
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
    
}

