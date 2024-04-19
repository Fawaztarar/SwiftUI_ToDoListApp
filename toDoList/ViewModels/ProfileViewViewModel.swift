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
}
    

