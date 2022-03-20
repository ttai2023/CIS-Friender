//
//  SizePreferenceKey.swift
//  CIS Friender
//
//  Created by Terri Tai on 18/3/2022.
//

import Foundation
import SwiftUI
//https://www.fivestars.blog/articles/swiftui-share-layout-information/

//will let us know size of a view to know how much to swipe the card
struct SizePreferenceKey: PreferenceKey {
    //value used when a view has no explicit value for this key
  static var defaultValue: CGSize = .zero
    //combines the key values found in the tree with a new one
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
