//
//  CreateAccountView.swift
//  CIS Friender
//
//  Created by Terri Tai on 15/2/2022.
//

import SwiftUI


struct CreateAccountView: View
{
    @State var newUsername: String = ""
    @State var newPassword: String = ""
    
    var body: some View
    {
        VStack
        {
            Text("Creating New Account")
                .font(.system(size: 50, weight: .bold))
                .foregroundColor(lightBlue)
            Image("Boy 1")
                .resizable() //so image can be resized
                .aspectRatio(contentMode: .fill) //prevents original photo to be distorted
                .frame(width: 150, height: 150)
             
            TextField("Username: " , text: $newUsername)
                .padding()
                .background(lightGrey)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            TextField("password: " , text: $newUsername)
                .padding()
                .background(lightGrey)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
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
        
    }
    
}



struct CreateAccountView_Previews: PreviewProvider
{
    static var previews: some View {
        CreateAccountView()
    }
}
