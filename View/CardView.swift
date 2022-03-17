//
//  CardView.swift
//  CIS Friender
//
//  Created by Terri Tai on 12/3/2022.
//

import SwiftUI

struct CardView: View {
    @State var card: CISUser
//    @Binding var sign: String
//    @Binding var mbti: String
//    @Binding var swipeDirection: SwipeDirection

    var body: some View {
        
        ZStack(alignment: .topLeading) {
            if card.imageName == "" {
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundColor(Constants.darkBlue)
            }
            else {
                Image(card.imageName) .resizable()
            }
           
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Text(card.username).font(.largeTitle).fontWeight(.bold)
                    }
                    Text(card.bio)
                }
            }
            .padding()
            .foregroundColor(.white)
            
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
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: CISUser.data[0])
    }
}
