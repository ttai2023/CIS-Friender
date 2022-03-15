//
//  UserListView.swift
//  CIS Friender
//
//  Created by Shirley Deng on 7/3/2022.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct UserListView: View {
    let currTag: String?
    
    @EnvironmentObject private var userManager: UserManager
    @State var usersWithTag: [CISUser] = []
    @State var user: CISUser? = nil
    
    func getUsersWithTag() {
        userManager.firestore.collection("User")
            .getDocuments() { (querySnapshot, err) in
                //catch error
                if let err = err {
                    print("Error getting users: \(err)")
                }
                else {
                      for document in querySnapshot!.documents {
                          //convert document into CISUser object
                          self.user = try? document.data(as: CISUser.self)
                          
                          if let user = self.user {
                              if user.zodiac == currTag {
                                  usersWithTag.append(user)
                              }
                              else if user.MBTI == currTag {
                                  usersWithTag.append(user)
                              }
                              else if user.talent == currTag {
                                  usersWithTag.append(user)
                              }
                          }
                      }
                }
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10.0) {
            Image("Boy 1")
                .resizable() //so image can be resized
                .aspectRatio(contentMode: .fill) //prevents original photo to be distorted
                .frame(width: 150, height: 150)//frame of circle
                .clipped() //area outside of frame will be cut
                .cornerRadius(100)
                .padding(.bottom, 10)
            
            List {
                if let user = self.user {
                    HStack {
                        Text("Username")
                            .bold()
                        Spacer()
                        Text(user.username)
                    }
                    HStack {
                        Text("Email")
                            .bold()
                        Spacer()
                        Text(user.email)
                    }
                    HStack {
                        Text("Zodiac Sign")
                            .bold()
                        Spacer()
                        Text(user.zodiac)
                    }
                    HStack {
                        Text("MBTI")
                            .bold()
                        Spacer()
                        Text(user.MBTI)
                    }
                    HStack {
                        Text("Talent")
                            .bold()
                        Spacer()
                        Text(user.talent)
                    }
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserListView(currTag: nil)
        }
    }
}
