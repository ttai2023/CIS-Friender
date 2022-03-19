//
//  UserProfileView.swift
//  CIS Friender
//
//  Created by MJ on 15/2/2022.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseDatabase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseFirestoreCombineSwift


struct UserProfileView: View {
    @EnvironmentObject private var userManager: UserManager
    @State private var isPickAvatarPresented = false
    
    // create a database reference to locate the data
   
    
    //let ref = Database.database().reference(withPath: "Users")
   
    @State public var username: String = ""
    @State public var useremail: String = ""
    @State public var sign: String = ""
    @State public var mbti: String = ""
    @State public var bio: String = ""
    @State private var isEditing = false
    
    //for image picker
    @State private var imageName: String?
    
    @State private var showSheet = false
    
    var signs = ["Unknown", "Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
    
    var mbtis = ["Unknown", "ESTJ", "ENTJ", "ESFJ", "ENFJ", "ISTJ", "ISFJ", "INTJ", "INFJ", "ESTP", "ESFP", "ENTP", "ENFP", "ISTP","ISFP", "INTP", "INFP"]
    
    @State private var selectedColor = "Red"
    
    let lightGrey = Color(red: 0.827, green: 0.870, blue: 0.894, opacity: 0.5)
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10.0)
        {
            if let imageName = imageName {
                Image(imageName)
                    .resizable() //so image can be resized
                    .aspectRatio(contentMode: .fill) //prevents original photo to be distorted
                    .frame(width: 150, height: 150)//frame of circle
                    .clipped() //area outside of frame will be cut
                    .cornerRadius(100)
                    .padding(.bottom, 10)
            }
            else {
                Image("Boy 1")
                    .resizable() //so image can be resized
                    .aspectRatio(contentMode: .fill) //prevents original photo to be distorted
                    .frame(width: 150, height: 150)//frame of circle
                    .clipped() //area outside of frame will be cut
                    .cornerRadius(100)
                    .padding(.bottom, 10)
            }
            
            Button(action: {isEditing.toggle()}) {
                VStack {
                    Image(systemName: "pencil.circle")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 40)
                        .foregroundColor(Constants.darkBlue)
                    Text("Edit Profile")
                        .foregroundColor(Constants.darkBlue)
                }
            }
                Button
                {
                    isEditing = true
                    isPickAvatarPresented  = true
                } label: {
                    Text("Change profile photo")
                            .font(.headline)
                            .frame(maxWidth: 200)
                            .frame(height: 25)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.262745098, green: 0.0862745098, blue: 0.8588235294, alpha: 1)), Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(16)
                            .foregroundColor(.white)
                }
            .sheet(isPresented: $isPickAvatarPresented)
            {
                PickAvatar(imageName: $imageName)
            }
            .padding(.horizontal)
            
            if !isEditing
            {
                List {
                    HStack {
                        Text("Username")
                            .bold()
                        Spacer()
                        Text(userManager.currentUser?.username ?? "unknown")
                    }
                    HStack {
                        Text("Email")
                            .bold()
                        Spacer()
                        Text(userManager.currentUser?.email ?? "unknown")
                    }
                    HStack {
                        Text("Zodiac Sign")
                            .bold()
                        Spacer()
                        Text(sign)
                    }
                    HStack {
                        Text("MBTI")
                            .bold()
                        Spacer()
                        Text(userManager.userMBTI)
                    }
                    HStack {
                        Text("Bio")
                            .bold()
                        Spacer()
                        Text(bio)
                    }
                }
            }
            else {
                Form {
                    HStack {
                        Text("Username")
                            .bold()
                        Spacer()
                        TextField("Username", text: $username)
                    }
                    
                    Picker("Zodiac Sign", selection: $sign) {
                        ForEach(signs, id: \.self) {sign in
                            Text(sign)
                        }
                    }
                    
                    Picker("MBTI", selection: $mbti) {
                        ForEach(mbtis, id: \.self) {mbti in
                            Text(mbti)
                        }
                    }
                    
                    HStack {
                        Text("Bio")
                            .bold()
                        Spacer()
                        TextField("bio", text: $bio)
                    }
                    
                    HStack {
                        Text("Sign out")
                            .bold()
                        Spacer()
                        TextField("bio", text: $bio)
                    }
                    
                    HStack {
                        Text("DELETE ACCCOUNT")
                            .bold()
                        foregroundColor(.red)
                        Spacer()
                        TextField("bio", text: $bio)
                    }


                }
            }
            
        }
        .navigationBarHidden(true)
        .onChange(of: username) { newValue in
            userManager.currentUser?.username = newValue
        }
        .onChange(of: useremail) { newValue in
            userManager.currentUser?.email = newValue
        }
        .onChange(of: sign) { newValue in
            userManager.currentUser?.zodiac = newValue
        }
        .onChange(of: mbti) { newValue in
            userManager.currentUser?.MBTI = newValue
        }
        .onChange(of: bio) { newValue in
            userManager.currentUser?.bio = newValue
        }
        .task {
            self.username = userManager.currentUser?.username ?? ""
            self.useremail = userManager.currentUser?.email ?? ""
            self.sign = userManager.currentUser?.zodiac ?? ""
            self.mbti = userManager.currentUser?.MBTI ?? ""
            self.bio = userManager.currentUser?.bio ?? ""
        }
    }
    
}

//TODO: DELETE ACCOUNT
//TODO: Sign out

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
            .environmentObject(UserManager())
    }
}
