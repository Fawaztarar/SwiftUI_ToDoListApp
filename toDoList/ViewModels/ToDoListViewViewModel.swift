//
//  ToDoListViewViewModel.swift
//  toDoList
//
//  Created by Fawaz Tarar on 16/04/2024.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject {
    @Published var isShowingNewItemView: Bool = false 
    
    private let userId: String


    init(userId: String) {
        self.userId = userId
    }
    
//deleting the item from the database
    func deleteItem(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()


    }
}
