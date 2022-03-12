//
//  SwipingView.swift
//  CIS Friender
//
//  Created by Shirley Deng on 23/2/2022.
//

import SwiftUI

struct SwipingView: View {
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
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "star.circle")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 45)
                        .foregroundColor(Constants.darkBlue)
                }
                
            }.padding(.horizontal)
        }
    
    }
}

struct SwipingView_Previews: PreviewProvider {
    static var previews: some View {
        SwipingView()
    }
}

struct CardView: View {
    @State var card: CISUser
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            Image(card.imageName) .resizable()
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
        .frame(height:600)
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
                        
                    }
                }
                .onEnded{ value in
                    // user stops dragging
                    // bouncing effect
                    withAnimation(.interpolatingSpring(mass:1.0,stiffness:50,damping:8,
                    initialVelocity: 0)) {
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
