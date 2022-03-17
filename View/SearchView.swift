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
//                              if !tagsDict.isEmpty {
                                  //check if user's zodiac exists already
                                  let zodiacExists = tagsDict[user.zodiac] != nil
                                  print("Does user's zodiac exist already? " + String(zodiacExists))
                                  
                                  if zodiacExists {
                                      print("Zodiac already exists")
                                      print("Original zodiac: " + user.zodiac + String(tagsDict[user.zodiac] ?? 0))
                                      //if already exists, increase value by 1
                                      tagsDict.updateValue(tagsDict[user.zodiac] ?? 0 + 1, forKey: user.zodiac)
                                      print("Updated zodiac: " + user.zodiac + String(tagsDict[user.zodiac] ?? 0))
                                  }
                                  else {
                                      //if doesn't already exists, create new key value pair
                                      tagsDict[user.zodiac] = 0
                                      print("Zodiac doesn't already exist")
                                      print("New zodiac: " + user.zodiac + String(tagsDict[user.zodiac] ?? 0))
                                  }
                                  
                                  let MBTIExists = tagsDict[user.MBTI] != nil
                                  if !MBTIExists {
                                      tagsDict[user.MBTI] = 0
                                  }
                                  else {
                                      tagsDict.updateValue(tagsDict[user.MBTI] ?? 0 + 1, forKey: user.MBTI)
                                  }
                                  
                                  let talentExists = tagsDict[user.talent] != nil
                                  if !talentExists {
                                      tagsDict[user.talent] = 0
                                  }
                                  else {
                                      tagsDict.updateValue(tagsDict[user.talent] ?? 0 + 1, forKey: user.talent)
                                  }
//                              }
//                              else {
//
//                              }

//                              for tag in user.tags {
//                                  allTags.insert(tag)
//                              }
                          }
                      }
                }
                print("tags: ", tagsDict)
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
        var maxValue: Int = 0
        for (tag, quantity) in tagsDict {
//            if quantity >= maxValue {
//                maxValue = quantity
//            }
            tags.append(tag)
        }
        print("tags: ", tags, tagsDict)
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
