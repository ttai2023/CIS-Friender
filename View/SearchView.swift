//
//  SearchView.swift
//  CIS Friender
//
//  Created by Shirley Deng on 25/2/2022.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct SearchView: View
{
    //get array of tags from current tags
    var names: [String] = ["terri", "michelle", "keona", "shirley"]
    //initialise text in search bar
    @State private var searchText = ""
    
    var body: some View
    {
        NavigationView
        {
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink(destination: Text(name)) {
                        //navigate to UserProfile View
                        Text(name)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Look for someone") {
                ForEach(searchResults, id: \.self) { result in
                    Text("Are you looking for \(result)?").searchCompletion(result)
                }
            }
            .navigationTitle("Search")
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

struct SearchView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SearchView()
    }
}

//class UserProfileViewModel: ObservableObject {
//    let db = Firestore.firestore()
//    @State private var errorMessage = ""
//    //maybe create an array of CISUser objects to return
////    var username:String
////    var email:String
////    var bio:String
//
//    Label("Error", systemImage: "cross.fill")
//    if errorMessage.isEmpty {
//        Label(errorMessage, systemImage: "cross.fill")
//    }
//
//    func getUsers() {
//        db.collection("users").getDocuments() { [self] (documentSnapshot, err) in
//            if err != nil {
//                    self.errorMessage = "Cannot get users"
//                } else {
//                    for document in documentSnapshot!.documents {
//                        //convert documentSnapshot to CISUser object
////                        documentSnapshot.toObject
//                    }
//                }
//        }
//    }
//}
//
//struct UserProfileView: View {
//    @StateObject private var viewModel = UserProfileViewModel()
//
//    var body: some View {
//
//    }
//}
