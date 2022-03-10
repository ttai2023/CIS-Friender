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
    @EnvironmentObject private var userManager: UserManager
    @State var allTags: Set<String> = []
    @State var user: CISUser?
    
    //add all current tags to allTags set
    //move to usermanager??
    func getTags() {
        //fetch all users from firebase
        userManager.firestore.collection("User")
            .getDocuments() { (querySnapshot, err) in
                //catch error
                if let err = err {
                    print("Error getting users: \(err)")
                }
                else {
                      for document in querySnapshot!.documents {
                          //try? -> self.user will be nil, try! -> app will crash
                          //convert document into CISUser object
                          self.user = try? document.data(as: CISUser.self)
                          //loop through each tag in tags Array in current user
                          if let user = self.user {
                              for tag in user.tags {
                                  allTags.insert(tag)
                              }
                          }
                      }
                }
        }
    }
    
    //initialise text in search bar
    @State private var searchText = ""
    
    var body: some View
    {
        List {
            ForEach(searchResults, id: \.self) { tag in
                //navigate to UserProfile View
                NavigationLink(tag, destination: UserListView(currTag: tag))
            }
        }
        .searchable(text: $searchText, prompt: "Look for a tag") {
            ForEach(searchResults, id: \.self) { result in
                Text("Are you looking for \(result)?").searchCompletion(result)
            }
        }
        .navigationTitle("Search")
        //task runs as view appears on the screen
        .task {
            getTags()
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return Array(allTags)
        } else {
            return Array(allTags).filter { $0.contains(searchText) }
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
