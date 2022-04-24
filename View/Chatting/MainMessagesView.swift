//
//  MainMessagesView.swift
//  CIS Friender
//
//  Created by Kiki on 2/4/2022.
//

import SwiftUI
import Firebase
import FirebaseAuth

class MainMessagesViewModel: ObservableObject {

    @Published var errorMessage = ""
    @Published var cisUser : CISUser?
    @EnvironmentObject private var userManager: UserManager
    @EnvironmentObject private var swipingData: SwipingModel

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

                guard let data = snapshot?.data() else {
                    self.errorMessage = "No data found"
                    return

                }
                
//                for i in swipingData.swipedUsers
//
//
//                swipingdata.swipedUsers
//           not sure whether its string or not
//                let id = data["id"] as? String ?? ""
//                let email = data["email"] as? String ?? ""
//                let username = data["username"] as? String ?? ""
//                let profileImageUrl = data["profileImageUrl"] as? String ?? ""
//
//                //Get information
//                self.cisUser = CISUser(id: id, email: email, username: username)
            }
        }
}

struct MainMessagesView: View {

    @State var shouldShowLogOutOptions = false

    private var customNavBar: some View {
        HStack(spacing: 16) {

            //TODO: Get profile picture
            Image(systemName: "person.fill")
                .font(.system(size: 34, weight: .heavy))

            VStack(alignment: .leading, spacing: 4) {
                //TODO: Get user's username and display here
//                Text("\(cisUser?.username ?? "")")
//                    .font(.system(size: 24, weight: .bold))

                
                HStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 14, height: 14)
                    Text("online")
                        .font(.system(size: 12))
                        .foregroundColor(Color(.lightGray))
                }

            }

            Spacer()
            Button {
                shouldShowLogOutOptions.toggle()
            } label: {
                Image(systemName: "gear")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(.label))
            }
        }
        .padding()
        .actionSheet(isPresented: $shouldShowLogOutOptions) {
            .init(title: Text("Settings"), message: Text("What do you want to do?"), buttons: [
                .destructive(Text("Sign Out"), action: {
                    print("handle sign out")
                }),
                    .cancel()
            ])
        }
    }

    var body: some View {
        NavigationView {

            VStack {
                customNavBar
                messagesView
            }
    }
    }
    

    private var messagesView: some View {
        ScrollView {
            ForEach(0..<10, id: \.self) { num in
                VStack {
                    HStack(spacing: 16) {
                        Image(systemName: "person.fill")
                            .font(.system(size: 32))
                            .padding(8)
                            .overlay(RoundedRectangle(cornerRadius: 44)
                                        .stroke(Color(.label), lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text("Username")
                                .font(.system(size: 16, weight: .bold))
                            Text("Message sent to user")
                                .font(.system(size: 14))
                                .foregroundColor(Color(.lightGray))
                        }
                        Spacer()

                        Text("22d")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    Divider()
                        .padding(.vertical, 8)
                }.padding(.horizontal)

            }.padding(.bottom, 50)
        }
    }
}

struct MainMessageView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessagesView()
    }
}

