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
    
    let fake = [
        Message(id: UUID().uuidString, text: "Hi", received: true, timestamp: Date()),
        Message(id: UUID().uuidString, text: "KEONA", received: true, timestamp: Date()),
        Message(id: UUID().uuidString, text: "1", received: true, timestamp: Date()),
        Message(id: UUID().uuidString, text: "2", received: true, timestamp: Date()),
        Message(id: UUID().uuidString, text: "3", received: true, timestamp: Date()),
        Message(id: UUID().uuidString, text: "4", received: true, timestamp: Date()),
        Message(id: UUID().uuidString, text: "BYE", received: true, timestamp: Date()),
        Message(id: UUID().uuidString, text: "im going out", received: true, timestamp: Date()),
        Message(id: UUID().uuidString, text: "lets go club", received: true, timestamp: Date()),
        Message(id: UUID().uuidString, text: "im leaving forever", received: true, timestamp: Date()),
        Message(id: UUID().uuidString, text: "how do i block u", received: true, timestamp: Date()),
        Message(id: UUID().uuidString, text: "Hi", received: true, timestamp: Date())
    ]
    
    var body: some View {
        VStack {
            VStack {
                TitleRowView()
                
                ScrollViewReader { proxy in
                    ScrollView {
//                        ForEach(messagesManager.messages, id: \.id) { message in
//                            MessageBubble(message: message)
//                        }
                        //shuffle them randomly and then it will generate chats randomly
                        ForEach(fake.shuffled().prefix(5), id: \.id) { message in
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

