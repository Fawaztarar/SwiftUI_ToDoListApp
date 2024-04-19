//
//  ToDoListitemsViewViewModel.swift
//  toDoList
//
//  Created by Fawaz Tarar on 18/04/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ToDoListitemsViewViewModel: ObservableObject {
    init() {}
    
    
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