//
//  NewItemViewViewModel.swift
//  toDoList
//
//  Created by Fawaz Tarar on 16/04/2024.
//

import FirebaseAuth
import FirebaseFirestore
import SwiftUI

class NewItemViewViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    
    init() {
    }

    func save() {
        guard canSave else {
            return
        }
        // get current user id
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }

        // create db model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdAt: Date().timeIntervalSince1970,
            isDone: false
            
        )

        // save model to firestore
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary()!)
    }
    
    var canSave: Bool { 
        guard !title.trimmingCharacters(in:.whitespaces).isEmpty else {
            return false
        }

        guard dueDate > Date().addingTimeInterval(-86400) else {
            return false
        }

        return true
    }
}




