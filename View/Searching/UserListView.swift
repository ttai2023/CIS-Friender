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
        usersWithTag.removeAll()
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
                              //if user is not current user
                              if user.email != userManager.currentUser?.email {
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
                print("Users with tag: ", usersWithTag)
        }
    }
    
    var body: some View {
        //make a recview of users
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(usersWithTag) { currUser in
                    NavigationLink(destination: OtherUserProfileView(currUser: currUser)) {
                        HStack {
                            //currUser.imageName
                            Image("Girl 1")
                                .resizable() //so image can be resized
                                .aspectRatio(contentMode: .fill) //prevents original photo to be distorted
                                .frame(width: 80, height: 80)//frame of circle
                                .clipped() //area outside of frame will be cut
                                .cornerRadius(100)
                                .padding(.bottom, 10)
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Username:")
                                        .bold()
                                    Text(currUser.username)
                                }
                                
                                HStack {
                                    Text(currUser.zodiac)
                                        .foregroundColor(Constants.darkBlue)
                                        .padding(5)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Constants.darkBlue)
                                        )
                                    Text(currUser.MBTI)
                                        .foregroundColor(Constants.blue)
                                        .padding(5)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Constants.blue)
                                        )
                                    Text(currUser.talent)
                                        .foregroundColor(Constants.skyBlue)
                                        .padding(5)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Constants.skyBlue)
                                        )
                                }
                            }
                        }
                    }
                }
            }
        }
        .task {
            getUsersWithTag()
        }
        //nav link to user profile
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserListView(currTag: nil)
        }
    }
}
