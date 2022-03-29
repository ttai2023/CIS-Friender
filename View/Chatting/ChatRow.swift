//
//  ChatRow.swift
//  CIS Friender
//
//  Created by Kiki on 14/3/2022.
//

import SwiftUI

struct ChatRow: View {
    
    let chat:Chat
    
    var body: some View {
        HStack(spacing: 20){
            Image(chat.person.imgString)
                .resizable()
                .frame(width: 70, height: 70, alignment: .topLeading)
                .clipShape(Circle())
            
            ZStack{
                VStack(alignment: .leading) {
                    HStack{
                        //TODO: Fetch users
                        Text(chat.person.name)
                            .bold()
                            .foregroundColor(Constants.darkBlue)
                        
                        Spacer()
                        //TODO: Sent date
                        Text(chat.messages.last?.date.description ?? "")
                            .foregroundColor(Constants.lightBlue)
                    }
                    
                    Spacer()
                
                        //TODO: Display user last message
                    Text(chat.messages.last?.text ?? "")
                            .lineLimit(2)
                            .frame(maxWidth: .infinity)
                            .padding()
                    
                }
            }
        
            .frame(height:80)
            Circle()
                .foregroundColor(chat.hasUnreadMessage ? .blue : .clear )
                .frame(width: 18, height: 18)
                .frame(minWidth: .infinity,alignment: .trailing)
        }
    }
    
    func todayDate(){
        var components = Calendar.current.dateComponents( [.hour,.minute], from: Date.now)
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chat: Chat.sampleChat[0])
    }
}
