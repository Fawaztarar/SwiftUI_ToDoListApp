//
//  LoginViewViewModel.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() {
        // Perform login action
    }
    func validate() -> Bool {
        return !email.isEmpty && !password.isEmpty
            
    }
}
