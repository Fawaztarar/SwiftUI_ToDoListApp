//
//  NewItemViewViewModel.swift
//  toDoList
//
//  Created by Fawaz Tarar on 16/04/2024.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var dueDate: Date = Date()
    
    init() {
    }

    func save() {
        
    }
}

