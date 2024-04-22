

//
//  ProfileView.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//


import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Profile Loading...")
                }
                Button(action: {
                    viewModel.signOut()
                }) {
                    Text("Sign Out")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                } 
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    // 'profile' function returns a view for displaying user profile information
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .padding()
            .foregroundColor(.blue)

        VStack(alignment: .leading) {
            HStack {
                Text("Name:")
                    .bold()
                Text(user.name)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 5)
            
            HStack {
                Text("Email:")
                    .bold()
                Text(user.email)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 5)
            
            HStack {
                Text("Member Since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joinedDate).formatted(date: .abbreviated, time: .shortened))")
                    .foregroundColor(.gray)
                    
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
