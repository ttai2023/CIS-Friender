//
//  ChatModel.swift
//  CIS Friender
//
//  Created by Kiki on 14/3/2022.
//

import Foundation

struct Chat: Identifiable{
    var id: UUID{person.id}
    let person: Person
    var messages: [Message]
    var hasUnreadMessage = false
}

struct Person: Identifiable{
    //TODO: fetch ID from firebase
    let id = UUID()
    let name: String
    let imgString: String
}

struct Message: Identifiable{
    
    enum MessageType{
        case Sent, Received
    }
    
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init(_ text: String, type: MessageType, date: Date){
        self.date = date
        self.type = type
        self.text = text
    }
    
    init(_ text: String, type: MessageType){
        self.init(text, type: type, date: Date())
    }
}

extension Chat{
    static let sampleChat = [
        Chat(person:Person(name:"Joy",imgString: "girl1"),messages:[
           // Message("That's so lame",type: .Sent, date: "19/07/2022")
        ],hasUnreadMessage: true)
    ]
        
}
