//
//  Message.swift
//  CIS Friender
//
//  Created by Kiki on 31/3/2022.
//

import Foundation

struct Message: Identifiable, Codable{
    var id: String
    var text:String
    var received: Bool
    var timestamp: Date
}
