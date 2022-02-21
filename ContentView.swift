//
//  ContentView.swift
//  CIS Friender
//
//  Created by Terri Tai on 12/2/2022.
//

import SwiftUI

//set grey colour
//let lightGrey = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
//let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
//let darkBlue = Color(red: 0.0, green: 0.0, blue: 139.0)

//overall view of this UI
struct ContentView: View
{
    //declare variables
    //@State --> allow textview to render depending on what gets inputted
    @State var username: String = ""
    @State var password: String = ""
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
            TextField("Username: " , text: $username)
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
                .background(Color.blue)
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

//the whole thing (the iPhone)
struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
