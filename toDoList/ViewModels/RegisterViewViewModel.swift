//
//  RegisterViewViewModel.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//



import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func register() {
        guard validate() else {
            return
        }
        // try to register
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.addUserToDatabase(id: userId)
        }
    }
    
    private func addUserToDatabase(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           password: password,
                           joinedDate: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary() ?? [:]) { error in
                // Handle error if needed
            }
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty && !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        // email with @ and .
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        // password length is at least 6 characters long
        guard password.count >= 6 else {
            return false
        }
        
        
        return true
    }
}

