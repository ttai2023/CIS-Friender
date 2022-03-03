    //
//  LoginView.swift
//  CIS Friender
//
//  Created by Terri Tai on 16/2/2022.
//

import SwiftUI
import Firebase

let lightGrey = Color(red: 0.827, green: 0.870, blue: 0.894, opacity: 0.5)
let lightBlue = Color(red: 0.619, green: 0.803, blue: 0.913)
let skyBlue = Color(red: 0.313, green: 0.623, blue: 0.807)
let blue = Color(red: 0.176, green: 0.533, blue: 0.741)
let darkBlue = Color(red: 0, green: 0.407, blue: 0.647)

struct LoginView: View
{
    @State var email: String = ""
    @State var password: String = ""
    
    init(){
        FirebaseApp.configure()
    }
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
                .background(lightGrey)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            //SecureField --> changes content to dots after inputted
            SecureField("Password: ", text: $password)
                .padding()
                .background(lightGrey)
                .cornerRadius(5.0)
                .padding(.bottom, 15)
            //Login button
            NavigationLink(destination: MainView())
            {
                Text("LOGIN")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                //shape of the button
                .frame(width: 220, height: 50)
                .background(blue)
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
                .background(darkBlue)
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
