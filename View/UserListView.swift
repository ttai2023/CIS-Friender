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
        userManager.firestore.collection("users")
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
        //make a recview of users
        VStack(alignment: .center, spacing: 10.0) {
            List {
                if let user = self.user {
                    HStack {
                        Image("Boy 1")
                            .resizable() //so image can be resized
                            .aspectRatio(contentMode: .fill) //prevents original photo to be distorted
                            .frame(width: 150, height: 150)//frame of circle
                            .clipped() //area outside of frame will be cut
                            .cornerRadius(100)
                            .padding(.bottom, 10)
                    }
                    HStack {
                        VStack {
                            Text("Username")
                                .bold()
                            Spacer()
                            Text(user.username)
                        }
                        
                        VStack {
                            Text("Email")
                            Spacer()
                            Text(user.email)
                        }
                    }
                }
            }
        }
        .task {
            getUsersWithTag()
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
