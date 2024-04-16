//
//  ProfileView.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//

import SwiftUI

struct ProfileView: View{
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Profile")
            .toolbar {
                    Button(action: {
                        // Add button action here
                    }) {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
        }
    }


#Preview {
    ProfileView()
}

