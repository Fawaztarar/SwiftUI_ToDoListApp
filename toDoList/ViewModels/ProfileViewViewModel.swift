//
//  ProfileViewViewModel.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {

    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)

        // update the item in the database
        let db = Firestore.firestore()
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }

        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary()!)
           
    }
    }
    

