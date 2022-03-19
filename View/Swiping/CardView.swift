//
//  CardView.swift
//  CIS Friender
//
//  Created by Terri Tai on 12/3/2022.
//

import SwiftUI

struct CardView: View {
    @State var card: CISUser
    @Binding var swipeDirection: SwipeDirection
    @Binding var size: CGSize

    var body: some View {

        ZStack(alignment: .center) {

            VStack(spacing:0) {
                Text(card.username).font(.largeTitle).fontWeight(.bold)
                if card.imageName == "" {
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundColor(Constants.darkBlue)
                }
                else {
                    Image(card.imageName)
                        .resizable()
                        .frame(maxHeight: .infinity)
                        .clipped()
                        .padding()
                 
                }
                VStack(alignment: .center) {
                    HStack {
                        Text(card.zodiac)
                        Text(card.MBTI)
                    }
                    Text("tags")
                        .foregroundColor(Constants.darkBlue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Constants.darkBlue)
                                .padding(0.1)
                        )
                    Text(card.bio)
//                        .font(.custom(name: ))
                }
            }
            .padding()
            .foregroundColor(.black)
            VStack {
                HStack {
                    // if like
                    Image(systemName: "heart.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .foregroundColor(Color.red)
                        // if like, make visible
                        .opacity(Double(card.x/10 - 1))
                    Spacer()
                    // if rejected
                    Image(systemName: "xmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .foregroundColor(Color.red)
                        // if don't like, make visible
                        .opacity(Double(card.x/10 * -1 - 1))
                }
                .padding(10)
                Spacer()
            }
        }
        .cornerRadius(20)
        .frame(maxHeight: 580)
        // follows coordinates of CISUser card
        .offset(x: card.x, y: card.y)
        .rotationEffect(.init(degrees: card.degree))
        .gesture(
            DragGesture()
                .onChanged { value in
                    // user is dragging card
                    withAnimation(.default) {
                        card.x = value.translation.width
                        card.y = value.translation.height
                        card.degree = 7 * (card.x > 0 ? 1 : -1 )
//   swipeDirection = card.x > 0 ? .left : .right
                    }
                }
                .onEnded{ value in
                    // user stops dragging
                    // bouncing effect
                    withAnimation(.interpolatingSpring(mass:1.0,stiffness:50,damping:8,
                    initialVelocity: 0)) {
//                        swipeDirection = .none
                        // how much they're dragging
                        switch value.translation.width {
                            
                            // swipe left
                            case 0...100:
                                // go back to original position
                                card.x = 0; card.degree = 0; card.y = 0
                                
                            
                            case let x where x > 100:
                                // disappear from screen completely
                                card.x = 500; card.degree = 12
                
                            
                            //swipe right
                            case (-100)...(-1):
                                // go back to original position
                                card.x = 0; card.degree = 0; card.y = 0;
                         
                            
                            case let x where x < -100:
                                // disappear from screen completely
                                card.x = -500; card.degree = -12
                            
                            default: card.x = 0; card.y = 0
                        }
                    }
                }
        )
        .onChange(of: swipeDirection, perform: { newValue in
            switch newValue {
                case .right:
                    card.x = size.width
                    card.degree = 12
                case .left:
                    card.x = -size.width
                    card.degree = -12
                case .none:
                    break
            }
        })
        .background(Constants.lightBlue).cornerRadius(20)
        .padding()
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: CISUser(username: "Keona", email: "", bio: "self-proclamed introvert", imageName: "keona1", zodiac: "Taurus", MBTI: "ISTP", talent: "none"), swipeDirection: .constant(.none), size: .constant(CGSize.zero))
    }
}
