//
//  CIS_FrienderApp.swift
//  CIS Friender
//
//  Created by Terri Tai on 12/2/2022.
//

import SwiftUI
import Firebase

@main
struct CIS_FrienderApp: App {
    @StateObject private var userManager = UserManager()
    
    init()
    {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            
                MainView ()
            .environmentObject(userManager)
        }
    }
}
