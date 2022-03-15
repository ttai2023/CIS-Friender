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
    @State var user: CISUser?
    @State var forgotErrorMessage : String? = ""
    @State private var userEmail: String = ""
    
    var body : some View {
        
        NavigationView{
            VStack{
                Text("You are forgetful, but that's okay.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                    .foregroundColor(Constants.darkBlue)
                    .multilineTextAlignment(.center)
                
                
                    TextField("Enter email address", text : $userEmail).autocapitalization(.none).keyboardType(.emailAddress)
                    .padding()
                    .background(Constants.lightGrey)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    
                
                
                Button
                {
                    forgetPassword()
                    
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
                
                if forgotErrorMessage?.isEmpty == false{
                    Label(forgotErrorMessage!,systemImage: "exclamationmark.triangle.fill")
                        .foregroundColor(Color.red)
                }
                
            }
        }
    }
    
    func forgetPassword(){
        Auth.auth().sendPasswordReset(withEmail: userEmail) { error in
            if let error = error{
                //fail
                forgotErrorMessage = "oh dip"
            }
            else{
                //suceed
                forgotErrorMessage = "Sent! (▰˘◡˘▰)"
            }
        }
    
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
