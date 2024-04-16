//
//  ToDoListView.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//

import SwiftUI

struct ToDoListView: View {
    @State private var isLoggedIn = true
    
    var body: some View {
        VStack {
            if isLoggedIn {
                Text("Welcome to your account!")
                Button(action: {
                    // Sign out logic
                    isLoggedIn = false
                }) {
                    Text("Sign Out")
                }
            } else {
                LoginView()
            }
        }
    }
}


struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
