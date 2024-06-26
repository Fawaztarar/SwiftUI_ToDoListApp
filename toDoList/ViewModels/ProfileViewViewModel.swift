//
//  ProfileViewViewModel.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//

import Foundation
import SwiftUI
import FirebaseAuth 
import FirebaseFirestore 

class ProfileViewViewModel: ObservableObject {
    
    
    @Published var user: User? = nil
    
    //fetch user data
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    password: data["password"] as? String ?? "",
                    joinedDate: data["joinedDate"] as? TimeInterval ?? 0
                )
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out")
        }
    }
    // deleting a user permanently from the database
    @Published var shouldNavigateToRegister = false
    
    
    func deleteUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        // First, delete all todos associated with the user.
        db.collection("users").document(userId).collection("todos").getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting todos documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    document.reference.delete()
                }
                
                // After deleting todos, delete the user's document.
                db.collection("users").document(userId).delete { [weak self] error in
                    if let error = error {
                        print("Error deleting user document: \(error.localizedDescription)")
                    } else {
                        // User document deleted successfully, now delete the authentication entry.
                        Auth.auth().currentUser?.delete { authError in
                            if let authError = authError {
                                print("Auth delete error: \(authError.localizedDescription)")
                            } else {
                                // If everything was successful, trigger navigation to RegisterView.
                                DispatchQueue.main.async {
                                    self?.shouldNavigateToRegister = true
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
