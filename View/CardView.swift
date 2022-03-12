//
//  CardView.swift
//  CIS Friender
//
//  Created by Terri Tai on 12/3/2022.
//

import SwiftUI

struct CardView: View {
    let card: CISUser
    let cardGradient = Gradient (colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            Image(card.imageName) .resizable()
            LinearGradient (gradient: cardGradient, startPoint: .top, endPoint: .bottom)
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
        }
        .cornerRadius(8)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(SwipingView.card)
    }
}
