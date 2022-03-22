//
//  ChattingView.swift
//  CIS Friender
//
//  Created by Kiki on 14/3/2022.
//

import SwiftUI

struct ChattingView: View {
    
    @StateObject var viewModel = ChatsViewModel()
    
    @State private var query = ""
    
    var body: some View {
        List{
            ForEach(viewModel.getSortedFilteredChats(query: query)){ chat in
                ZStack{
                    
                    ChatRow(chat: chat)
                
                NavigationLink(destination:{
                    ChatView(chat: chat)
                        .environmentObject(viewModel)
                }){
                    EmptyView()
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width:0)
                .opacity(0)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true){
                    Button(action:{
                        viewModel.markAsUnread(chat.hasUnreadMessage, chat: chat)
                    }){
                        if chat.hasUnreadMessage{
                            Label("Read", systemImage: "text.bubble")
                        }else{
                            Label("Unread", systemImage: "circle.fill")
                        }
                    }
                    .tint(.blue)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Chats")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // do something here
                } label: {
                    Label("tap to stop keona singing", systemImage: "square.and.pencil")
                }
            }
        }
    }
}

struct ChattingView_Previews: PreviewProvider {
    static var previews: some View {
        ChattingView()
    }
}
