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
    
    init() {}
       
    
    func login() {
        guard validate() else {
            return
        }
        // try to login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        // email with @ and .
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        return true    
    }
    
    func loginAsGuest() {
        //In this implementation, the loginAsGuest() function uses Firebase's signInAnonymously method to authenticate the user anonymously. Upon successful authentication, you can handle navigation to the main screen or any other necessary actions.
        
       // Remember to enable anonymous authentication in your Firebase project settings for this to work. Additionally, you might want to handle cases where guest users need to access their data in subsequent sessions or if they decide to upgrade to a full account later on.
        
            Auth.auth().signInAnonymously { [weak self] authResult, error in
                guard let self = self else { return }
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else {
                    // Guest login successful
                    print("Guest Logic Successful")
                    self.errorMessage = ""
                    // Navigate to the main screen or perform any other action
                }
            }
        }
}