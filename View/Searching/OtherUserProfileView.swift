//
//  OtherUserProfileView.swift
//  CIS Friender
//
//  Created by Shirley Deng on 20/3/2022.
//

import SwiftUI

struct OtherUserProfileView: View {
    let currUser: CISUser?

    var body: some View {
        if let user = self.currUser {
            VStack(alignment: .center, spacing: 10)
            {
                //user.imageName
                Image(user.imageName)
                    .resizable() //so image can be resized
                    .aspectRatio(contentMode: .fill) //prevents original photo to be distorted
                    .frame(width: 150, height: 150)//frame of circle
                    .clipped() //area outside of frame will be cut
                    .cornerRadius(100)
                    .padding(.bottom, 10)
            }
            
            List {
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
                    Text("MBTI")
                        .bold()
                    Spacer()
                    Text(user.talent)
                }
                HStack {
                    Text("Bio")
                        .bold()
                    Spacer()
                    Text(user.bio)
                }
            }
        }
    }
}

struct OtherUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OtherUserProfileView(currUser: nil)
    }
}
