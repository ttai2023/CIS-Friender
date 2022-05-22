//
//  ContentView.swift
//  CIS Friender
//
//  Created by Kiki on 31/3/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
    @EnvironmentObject private var userManager: UserManager
    @EnvironmentObject var swipingData: SwipingModel
    
    var body: some View {
        VStack {
            VStack {
                TitleRowView()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight]) // Custom cornerRadius modifier added in Extensions file
                    .onChange(of: messagesManager.lastMessageId) { id in
                        // When the lastMessageId changes, scroll to the bottom of the conversation
                        withAnimation {
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                }
            }
            .background(Constants.lightBlue)
            
            MessageField()
                .environmentObject(messagesManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

