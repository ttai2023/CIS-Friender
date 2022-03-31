//
//  ContentView.swift
//  CIS Friender
//
//  Created by Kiki on 31/3/2022.
//

import SwiftUI

struct ContentView: View {
    //array of messages
    var messageArray = ["DUDE LISTEN TO MY NEW SONG", "It's called feel my rhythm!"]
    
    var body: some View{
        VStack{
        VStack{
            TitleRowView()
            
            ScrollView{
                ForEach(messageArray, id :\.self){ text in
                    MessageBubble(message: Message (id:
                        "12345", text: text, received: true, timestamp: Date()))
                        
                    }
                    
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
        }
    }
        .background(Constants.blue)
        MessageField()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
