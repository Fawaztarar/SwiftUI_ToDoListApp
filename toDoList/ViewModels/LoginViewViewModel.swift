//
//  LoginViewViewModel.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func login() {
        guard validate() else {
            return
        }
        // try to login
        Auth.auth().signIn(withEmail: email, password: password)

  
    }
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty && !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        // email with @ and .
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        return true    
    }
}
