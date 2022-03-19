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
    @EnvironmentObject private  var swipingData: SwipingModel
    @State var listOfUsers = [CISUser]()
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
                    ZStack {
                        if let users = swipingData.listOfUsers {
                            if users.isEmpty {
                                Text("Looks like there are no more users to swipe through right now :( Come back later!")
                                    .font(.caption)
                                    .foregroundColor(Constants.blue)
                            }
                            else {
                                ForEach(listOfUsers.reversed()) { user in
                                    CardView(card: user, swipeDirection: $swipeDirection, size: $size)
                                        .padding(8)
                                        .environmentObject(swipingData)
                                }
                            }
                        }
                    }
                }
//            }
            
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

