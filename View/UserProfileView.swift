//
//  UserProfileView.swift
//  CIS Friender
//
//  Created by Terri Tai on 15/2/2022.
//

import SwiftUI
import FirebaseDatabase


struct UserProfileViews: View {
    // create a database reference to locate the data
    @EnvironmentObject private var userManager: UserManager
    
    let ref = Database.database().reference(withPath: "Users")
    
    
    
    var body: some View {
        Text("User Profile" )
    }
}


struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileViews()
    }
}
