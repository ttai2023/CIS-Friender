//
//  SwipingView.swift
//  CIS Friender
//
//  Created by Shirley Deng on 23/2/2022.
//

import SwiftUI
import Firebase
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseFirestoreCombineSwift
import Foundation

struct SwipingView: View {
    @State var swipeDirection: SwipeDirection = .none
    @EnvironmentObject private var userManager: UserManager
    @State var listOfUsers = [CISUser]()
    @State var size = CGSize.zero
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.crop.square")
                    .resizable().aspectRatio(contentMode: .fit).frame(height: 45)
                    .foregroundColor(Constants.blue)
                Text("Friender")
                    .font(Font.custom("inconsolata", size: 45))
                    .bold()
                    .foregroundColor(Constants.blue)
            }.padding(.horizontal).frame(height: 45)
            ZStack {
                ZStack {
                    ForEach(listOfUsers.reversed()) { user in
                        CardView(card: user, swipeDirection: $swipeDirection, size: $size).padding(8)
                    }
                }
            }
            
            HStack {
                Button(action: {
                    swipeDirection = .left
                }) {
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
                Button(action: {
                    swipeDirection = .right
                }) {
                    Image(systemName: "heart.circle")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 45)
                        .foregroundColor(Constants.blue)
                        .foregroundColor(Constants.blue)
                }

            }.padding(.horizontal)
        }
        .background(
            //reads size of view
              GeometryReader { geometryProxy in
                Color.clear
                  .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
              }
            )
        .onPreferenceChange(SizePreferenceKey.self) { newSize in
                size = newSize
            }
        .task {
            getUsers()
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
                              if !(docUser.id == userManager.currentUser?.id)
                              {
                                  listOfUsers.append(docUser)
                              }
                          }
                          //loop through each user in users collection
                      }
                }
                print(listOfUsers)
        }
    }
}


struct SwipingView_Previews: PreviewProvider {
    static var previews: some View {
        SwipingView()
            .environmentObject(UserManager())
    }
}

