//
//  ToDoListItem.swift
//  toDoList
//
//  Created by Fawaz Tarar on 17/04/2024.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdAt: TimeInterval
    var isDone: Bool

    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
