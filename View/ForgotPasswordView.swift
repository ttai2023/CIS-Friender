//
//  LoginView.swift
//  CIS Friender
//
//  Created by Kiki on 12/3/2022.
//
import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

struct ForgotPasswordView:View{
    var body : some View {
        @State var user: CISUser?
        @State var forgotErrorMessage = ""
        
        NavigationView{
            VStack{
                Text("You are forgetful, but that's okay.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                    .foregroundColor(Constants.darkBlue)
                
                TextField("Enter email address", text : user?!.email).autocapitalization(.none).keyboardType(.emailAddress)
                
                Button
                {
                    //action
                    
                } label: {
                    Text("RESET")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                    
                    //shape of the button
                        .frame(width: 220, height: 50)
                        .background(Constants.blue)
                        .cornerRadius(15.0)
                        .padding(.bottom, 10)
                }
                
                if !forgotErrorMessage.isEmpty {
                    Label(forgotErrorMessage,systemImage: "exclamationmark.triangle.fill")
                        .foregroundColor(Color.red)
                }
                
            }
        }
    }
    
    func forgetPassword(){
        
    let forgotErrorMessage = "oh dip"
        
        if letforgotErrorMessage = forgotErrorMessage{
            //something went wrong
            
        }
        else{
            //reset password
        }
    }
    
    
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
