//
//  User.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//

import SwiftUI

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let password: String
    let joinedDate: TimeInterval

}

