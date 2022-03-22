//
//  Tag.swift
//  CIS Friender
//
//  Created by MJ on 22/3/2022.
//

import SwiftUI

// Tag Model
struct Tag: Identifiable, Hashable {
    var id = UUID().uuidString
    var text: String
    var size: CGFloat = 0
    
}

