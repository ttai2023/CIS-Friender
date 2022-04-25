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
    @EnvironmentObject private var swipingData: SwipingModel
    
    @State var size = CGSize.zero
//    @State var index: Int
//    var user: CISUser
    
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
//            GeometryReader { proxy in
//                let size = proxy.size
//                let index = CGFloat(swipingData.getIndex(user: user))
                ZStack {
                    if let users = swipingData.listOfUsers {
                        //if we let users become listOfUsers from swiping model
                        if users.isEmpty { //if list is empty
                            Text("Looks like there are no more users to swipe through right now :( Come back later!")
                                .font(.caption)
                                .foregroundColor(Constants.blue)
                        }
                        else {
                            ForEach(swipingData.listOfUsers.reversed().dropFirst()) { user in //show all cards except first user
                                
                                CardView(card: user, swipeDirection: .constant(.none), size: .constant(CGSize.zero)) //swipe direction and size is for automated swiping
                                    .padding(8)
                                    .environmentObject(swipingData)
                            }
                            CardView(card: swipingData.listOfUsers[0],swipeDirection: $swipeDirection, size: $size) //show the first user's card
                                .padding(8)
                                .environmentObject(swipingData)
                        }
                    }
                }
            
//            }
            
            HStack {
                Button(action: {
                    swipeDirection = .left
                    swipingData.listOfUsers.insert(swipingData.listOfUsers.reversed()[0],at: swipingData.listOfUsers.endIndex)
                    swipingData.listOfUsers.remove(at: 0)
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
                    swipingData.listOfUsers.insert(swipingData.listOfUsers.reversed()[0],at: swipingData.listOfUsers.endIndex)
                    swipingData.listOfUsers.remove(at: 0)
                }) {
                    Image(systemName: "heart.circle")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 45)
                        .foregroundColor(Constants.blue)
                        .foregroundColor(Constants.blue)
                }

            }.padding(.horizontal)
        }
        .task {
            swipingData.getUsers()
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
        .navigationBarHidden(true)
    }

}


struct SwipingView_Previews: PreviewProvider {
    static var previews: some View {
        SwipingView()
            .environmentObject(UserManager())
            .environmentObject(SwipingModel())
    }
}

