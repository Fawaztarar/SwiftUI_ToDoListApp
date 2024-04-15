//
//  toDoListApp.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//

import FirebaseCore
import SwiftUI

@main
struct toDoListApp: App {
    init () {
        FirebaseApp.configure()
    } 
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
