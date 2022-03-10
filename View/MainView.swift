//
//  MainView.swift
//  CIS Friender
//
//  Created by Terri Tai on 15/2/2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        if !userManager.isSignedIn {
            LoginView()
        } else {
            SwipingView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
