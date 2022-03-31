////
////  MessagesManager.swift
////  CIS Friender
////
////  Created by Kiki on 29/3/2022.
////
//
//import Foundation
//import Firebase
//import FirebaseFirestoreSwift
//import simd
//
//class MessageManager: ObservableObject{
//    @Published private(set) var messages: [Message] = []
//    let db = Firestore.firestore()
//
//    func getMessages(){
//        db.collection("messages").addSnapshotListener{ querySnapshot, error in
//            guard let documents = querySnapshot?.documents else{
//                print("Error fetching documents: \(String(describing: error))")
//                return
//            }
//            //compact map only return non nil elements of the document array
//
//            documents.compactMap{document -> Message? in
//                do{
//                    //take the document and get data, transform into message model
//                    return try document.data(as: Message.self)
//                }
//                catch{
//                    print("Error decoding document into message: \(error)")
//                    return nil
//                }
//            }
//        }
//    }
//
//}
