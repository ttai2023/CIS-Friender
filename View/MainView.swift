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
            NavigationView {
                LoginView()
            }
        }
        else {
            TabView {
                NavigationView {
                    SwipingView()
                }
                .tabItem {
                    Image(systemName: "person.crop.rectangle.stack")
                }
                NavigationView {
                    SearchView()
                }
                .tabItem {
                    Image(systemName: "magnifyingglass.circle.fill")
                }
                NavigationView {
                    ChattingView()
                }
                .tabItem{
                    Image(systemName: "bubble.right.circle")
                }
                NavigationView {
                    UserProfileView()
                }
                .tabItem {
                    Image(systemName: "person.circle")
                }
                
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View
    {
        let um = UserManager()
        um.isSignedIn = true
        return MainView().environmentObject(um)
    }
}

