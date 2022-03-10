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
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View
    {
        //stack stuff on top of each other vertically
        VStack
        {
            WelcomeText()
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
            
            //Login button
            
            //for the button, add
            //userManager.signIn()
            
            NavigationLink(destination: MainView())
            {
                Text("LOGIN")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                //shape of the button
                    .frame(width: 220, height: 50)
                    .background(Constants.blue)
                    .cornerRadius(15.0)
                    .padding(.bottom, 20)
                
            }
            NavigationLink(destination: CreateAccountView())
            {
                Text("CREATE ACCOUNT")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                //shape of the button
                    .frame(width: 220, height: 50)
                    .background(Constants.darkBlue)
                    .cornerRadius(15.0)
            }
        }
        //adds padding around the whole stack
        .padding()
    }
}
struct WelcomeText : View
{
    var body : some View
    {
        return Text("Welcome to Friender!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
    
}

