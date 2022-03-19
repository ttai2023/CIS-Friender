//
//  SwipingModel.swift
//  CIS Friender
//
//  Created by Terri Tai on 19/3/2022.
//
//youtube.com/watch?v=Ke2GjMVTxNs&ab_channel=Kavsoft

import SwiftUI

class SwipingModel: ObservableObject {
    //all users in database
    public var userManager: UserManager?
    @Published var listOfUsers = [CISUser]()
    @Published var swipedUsers = [CISUser]()

    func getUsers() {
        userManager?.firestore.collection("users")
            .getDocuments() { (querySnapshot, err) in
                //catch error
                if let err = err {
                    print("Error getting users: \(err)")
                }
                else {
                      for document in querySnapshot!.documents {
                          if let docUser = try? document.data(as: CISUser.self) {
                              if docUser.id != self.userManager?.currentUser?.id
                              {
                                  self.listOfUsers.append(docUser)
                              }
                          }
                          //loop through each user in users collection
                      }
                }
        }
    }
    
    //get index of swiped user
    func getIndex(user: CISUser) ->Int {
        let index = listOfUsers.firstIndex(where: { currUser in
            return user.id == currUser.id
        }) ?? 0 //else return 0
        return index
        
    }
    

}
