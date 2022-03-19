//
//  SearchView.swift
//  CIS Friender
//
//  Created by Shirley Deng on 25/2/2022.
//

import SwiftUI
import FirebaseAuth
import Firebase
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseFirestoreCombineSwift

struct SearchView: View
{
    @EnvironmentObject private var userManager: UserManager
//    @State var allTags: Set<String> = []
    @State var tagsDict: [String: Int] = [:]
    @State var user: CISUser?
    
    //add all current tags to allTags set
    //move to usermanager??
    func getTags() {
        tagsDict.removeAll()
        //fetch all users from firebase
        userManager.firestore.collection("users")
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
                          //if current user's zodiac/MBTI/talent doesn't exists, create new key value pair
                          //if already exists, increase quantity by 1
                          if let user = self.user {
                                  //check if user's zodiac exists already
                                  let zodiacExists = tagsDict[user.zodiac] != nil
                                  
                                  if zodiacExists {
                                      //if already exists, increase value by 1
                                      tagsDict.updateValue((tagsDict[user.zodiac] ?? 0) + 1, forKey: user.zodiac)
                                  }
                                  else {
                                      //if doesn't already exists, create new key value pair
                                      tagsDict[user.zodiac] = 0
                                  }
                                  
                                  let MBTIExists = tagsDict[user.MBTI] != nil
                                  if !MBTIExists {
                                      tagsDict[user.MBTI] = 0
                                  }
                                  else {
                                      tagsDict.updateValue((tagsDict[user.MBTI] ?? 0) + 1, forKey: user.MBTI)
                                  }
                                  
                                  let talentExists = tagsDict[user.talent] != nil
                                  if !talentExists {
                                      tagsDict[user.talent] = 0
                                  }
                                  else {
                                      tagsDict.updateValue((tagsDict[user.talent] ?? 0) + 1, forKey: user.talent)
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
        .task {
            getTags()
        }
        .navigationTitle("Search")
        //task runs as view appears on the screen
    }
    
    var searchResults: [String] {
        //convert dictionary keys into an array arranged in an ascending order of quantity (popularity)
        var tags: [String] = []
        var insertIndex: Int = 0
        var added: BooleanLiteralType = false
//        var maxValue: Int = 0
        
        //loop through each tag, quantity pair in tags dictionary
        for (dictTag, quantity) in tagsDict {
            added = false
            //if tags array is not empty
            if !tags.isEmpty {
                //loop through each tag in tags array
                for currTag in tags {
                    //check if the dictionary tag's quantity is more than the current array tag's quantity
                    if quantity > tagsDict[currTag] ?? 0 {
                        insertIndex = tags.firstIndex(of: currTag) ?? 0
                        //if yes, insert at current array tag's position
                        tags.insert(dictTag, at: insertIndex)
                        added = true
                        break
                    }
                }
                //if not added, add to array tag
                if !added {
                    tags.append(dictTag)
                }
            }
            //if tags array is empty, append tag to array tags
            else {
                tags.append(dictTag)
            }
        }
        
        if searchText.isEmpty {
            return tags
        } else {
            return tags.filter { $0.contains(searchText) }
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
