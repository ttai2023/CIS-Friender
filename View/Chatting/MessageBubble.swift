//
//  MessageBubble.swift
//  CIS Friender
//
//  Created by Kiki on 31/3/2022.
//

import SwiftUI

struct MessageBubble: View {
    //will only take in message in Message()
    var message: Message
    
    @State private var showTime = false
    //show time if the user taps on the message bubble
    
    var body: some View {
        //leading if user received, trailing if user didnt
        VStack(alignment: message.received ? .leading : .trailing ){
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.received ?
                                Color("Gray"): Color("Constants.lightBlue"))
                    .cornerRadius(30)
            }
            //if message is received, alignment will be leading
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            //if showtime is true
            if showTime{
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id:"12345", text: "Testing", received: true, timestamp: Date()))
    }
}
