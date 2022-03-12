//
//  SwipingView.swift
//  CIS Friender
//
//  Created by Shirley Deng on 23/2/2022.
//

import SwiftUI

struct SwipingView: View {
//    @State var swipeDirection: SwipeDirection = .none
    
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
                ForEach(CISUser.data.reversed()) { user in
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
    
}

struct SwipingView_Previews: PreviewProvider {
    static var previews: some View {
        SwipingView()
    }
}

