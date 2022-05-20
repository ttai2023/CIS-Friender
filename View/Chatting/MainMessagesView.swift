//
//  MainMessagesView.swift
//  CIS Friender
//
//  Created by Kiki on 2/4/2022.
//

//TODO: no user swiped -- display nothing
//TODO: Fix the row view

import SwiftUI
import Firebase
import FirebaseAuth

class MainMessagesViewModel: ObservableObject {

    @Published var errorMessage = ""
    @Published var cisUser : CISUser?
    @EnvironmentObject private var userManager: UserManager

    init() {
        fetchCurrentUser()
    }

    private func fetchCurrentUser() {
        
            guard let email = FirebaseManager.shared.auth.currentUser?.email else {
                self.errorMessage = "Could not find firebase email"
                return
            }
            FirebaseManager.shared.firestore.collection("users").document(email).getDocument { snapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to fetch current user: \(error)"
                    print("Failed to fetch current user:", error)
                    return
                }
                //get the user from the snapshot
                guard let data = snapshot?.data() else {
                    self.errorMessage = "No data found"
                    return
                }
                
            }
                
        }
}

struct MainMessagesView: View {
    @State var shouldNavigateToChatView = false
    @EnvironmentObject var swipingData: SwipingModel
    
    private var customNavBar: some View {
        HStack(spacing: 0.1) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("CHATS")
                        .font(.system(size: 40, weight: .bold))
                }
                Spacer()
                      }
                  }
    
    var body: some View {
        NavigationView {

            VStack {
                customNavBar
                messagesView
                NavigationLink("", isActive: $shouldNavigateToChatView) {
                                   ContentView()
                }
    }
    }
}
    private var messagesView: some View {
//        @EnvironmentObject var swipingData: SwipingModel
        ScrollView{
    ForEach(0..<10, id: \.self) { num in
            ForEach(swipingData.swipedUsers){ CISUser in
//            swipingData.swipedUsers.forEach { CISUser in
//            for i in swipingData.swipedUsers{
                VStack {
                    NavigationLink{
                        ContentView()
                    } label: {
                        HStack(spacing: 16) {
                            Image(CISUser.imageName)
                                .font(.system(size: 32))
                                .padding(8)
                                .overlay(RoundedRectangle(cornerRadius: 44)
                                            .stroke(Color(.label), lineWidth: 1)
                                )
                            VStack(alignment: .leading) {
                                Text(CISUser.username)
                                    .font(.system(size: 16, weight: .bold))
                            }

                        }
    Text("22d")
        .font(.system(size: 14, weight: .semibold))
                    }
                    Divider()
                        .padding(.vertical, 8)
                }.padding(.horizontal)
            }
        }
    }

}
    
  
}
struct MainMessageView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessagesView()
    }
}

