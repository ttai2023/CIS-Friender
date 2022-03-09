//
//  UserProfileView.swift
//  CIS Friender
//
//  Created by Terri Tai on 15/2/2022.
//

import SwiftUI
import FirebaseDatabase

struct UserProfileView: View {
    // create a database reference to locate the data
    //@EnvironmentObject private var userManager: UserManager
    
    //let ref = Database.database().reference(withPath: "Users")
    @EnvironmentObject private var userManager: UserManager
    @State public var username: String = ""
    @State public var sign: String = ""
    @State public var mbti: String = ""
    @State private var isEditing = false
    
    let lightGrey = Color(red: 0.827, green: 0.870, blue: 0.894, opacity: 0.5)
    
    
    var body: some View {
        
        
        VStack(alignment: .center, spacing: 10.0)
        {
            Image("Boy 1")
                .resizable() //so image can be resized
                .aspectRatio(contentMode: .fill) //prevents original photo to be distorted
                .frame(width: 150, height: 150)//frame of circle
                .clipped() //area outside of frame will be cut
                .cornerRadius(100)
                .padding(.bottom, 10)
//            List
//            {
//                HStack {
//                    Text("Name")
//                        .bold()
//                    Spacer()
//                    Text("name")
//                }
//                HStack {
//                    Text("Name")
//                        .bold()
//                    Spacer()
//                    Text("name")
//                }
//            }
//            Form {
//                HStack {
//                    Text("Username")
//                        .bold()
//                    Spacer()
//                    TextField("Username", text: $username)
//                }
//            }
            Button("Toggle Edit Mode") {
                isEditing.toggle()
            }
            
            if !isEditing
            {
                List {
                    HStack {
                        Text("Username")
                            .bold()
                        Spacer()
                        Text(username)
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
                }
            }
            
            
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
