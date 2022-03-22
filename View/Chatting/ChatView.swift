//
//  ChatView.swift
//  CIS Friender
//
//  Created by Kiki on 21/3/2022.
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var viewModel: ChatsViewModel
    
    let chat: Chat
    
    @State private var text = ""
    @FocusState private var isFocused
    
    var body: some View {
        VStack(spacing: 0){
            GeometryReader{ reader in
                ScrollView{
                    getMessagesView(viewWidth: reader.size.width)
                        .padding(.horizontal)
                }
            }
            .background(Constants.blue)
            
            toolbarView()
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            viewModel.markAsUnread(false, chat: chat)
        }
    }
    
    func toolbarView() -> some View{
        VStack{
            let height: CGFloat = 37
            HStack{
                TextField("Message ...", text: $text)
                    .padding(.horizontal, 10)
                    .frame(height: height)
                    .background(Constants.lightGrey)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .focused($isFocused)
                
                Button(action: sendMessage ){
                    Image(systemName: "paperflame.fill")
                        .foregroundColor(.white)
                        .frame(width: height, height: height)
                        .background(
                        Circle()
                            .foregroundColor(text.isEmpty ? .gray : .blue)
                        )
                }
                .disabled(text.isEmpty)
            }
            .frame(height: height)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
    }
    
    func sendMessage(){
        //Firebase here
    }
    
    let columns = [GridItem(.flexible(minimum: 10))]
    
    func getMessagesView(viewWidth: CGFloat) -> some View{
        LazyVGrid(columns: columns, spacing: 0){
            ForEach(chat.messages){ message in
                let isReceived = message.type == .Received
                HStack{
                    ZStack{
                    Text(message.text)
                            .padding(.horizontal)
                            .padding(.vertical, 12)
                            .background(isReceived ? Constants.darkBlue.opacity(0.2) : .green.opacity(0.9))
                            .cornerRadius(13)
                    }
                    .frame(width: viewWidth * 0.1, alignment: isReceived ? .leading : .trailing)
                    .padding(.vertical)
//                    .background(Constants.lightGrey)
                }
                .frame(maxWidth: .infinity, alignment: isReceived ? .leading: .trailing)
                .id(message.id) // imporatnt for automatic scrolling
            }
        }
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chat: Chat.sampleChat[0])
            .environmentObject(ChatsViewModel())
    }
}
