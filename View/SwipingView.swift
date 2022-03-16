//
//  SwipingView.swift
//  CIS Friender
//
//  Created by Shirley Deng on 23/2/2022.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct SwipingView: View {
//    @State var swipeDirection: SwipeDirection = .none
    @EnvironmentObject private var userManager: UserManager
    @State var listOfUsers = [CISUser]()
    
//    {
//        [
//
//            CISUser(username: "Keona", email:"keonal2023@student.cis.edu.hk", bio: "self-proclaimed introvert", imageName: "keona1", zodiac: "zodiac", MBTI: "MBTI", talent: "talent"),
//            CISUser(username: "Keona", email:"keonal2023@student.cis.edu.hk", bio: "self-proclaimed introvert", imageName: "keona2", zodiac: "zodiac", MBTI: "MBTI", talent: "talent"),
//            CISUser(username: "Keona", email:"keonal2023@student.cis.edu.hk", bio: "self-proclaimed introvert", imageName: "keona3", zodiac: "zodiac", MBTI: "MBTI", talent: "talent"),
//            CISUser(username: "Kirsten", email:"keonal2023@student.cis.edu.hk", bio: "i write poems", imageName: "kirsten", zodiac: "zodiac", MBTI: "MBTI", talent: "talent"),
//            CISUser(username: "Charlie", email:"keonal2023@student.cis.edu.hk", bio: "i love baking", imageName: "charlie", zodiac: "zodiac", MBTI: "MBTI", talent: "talent"),
//            CISUser(username: "Rachel", email:"keonal2023@student.cis.edu.hk", bio: "fun times", imageName: "rachel", zodiac: "zodiac", MBTI: "MBTI", talent: "talent")
//
//        ]
//    }
    
    var body: some View {
        VStack {
            HStack {
                Button (action: {}) {
                    Image(systemName: "person.crop.square")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 45)
                        .foregroundColor(Constants.blue)
                }
                Text("Friender")
                    .font(.system(size: 45))
                    .foregroundColor(Constants.blue)
            }.padding(.horizontal).frame(height: 45)
            
            ZStack {
                ForEach(listOfUsers.reversed()) { user in
                    CardView(card: user).padding(8)
                }
            }
            
            HStack {
                Button(action: {}) {
                    Image(systemName: "arrowshape.turn.up.backward.circle")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 45)
                        .foregroundColor(Constants.darkBlue)
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "xmark.circle")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 45)
                        .foregroundColor(Constants.blue)
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "info.circle")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 45)
                        .foregroundColor(Constants.blue)
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "heart.circle")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 45)
                        .foregroundColor(Constants.blue)
                        .foregroundColor(Constants.blue)
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "star.circle")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 45)
                        .foregroundColor(Constants.darkBlue)
                }
                
            }.padding(.horizontal)
        }
        .navigationBarHidden(true)
    }
    func getUsers(){
        userManager.firestore.collection("users")
            .getDocuments() { (querySnapshot, err) in
                //catch error
                if let err = err {
                    print("Error getting users: \(err)")
                }
                else {
                      for document in querySnapshot!.documents {
                          if let docUser = try? document.data(as: CISUser.self) {
                                  listOfUsers.append(docUser)

                          //loop through each tag in tags Array in current user
                      }
                }
            }
            }

    }
}

struct SwipingView_Previews: PreviewProvider {
    static var previews: some View {
        SwipingView()
    }
}

