

//
//  ProfileView.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//






import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    @State private var showingDeleteAlert = false

    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("You need to register")
                }

                // Sign Out button
                Button(action: viewModel.signOut) {
                    Text("Sign Out")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding() 

                // Delete account button
                Button(action: { showingDeleteAlert = true }) {
                    Text("Delete your account permanently")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red.opacity(0.5))
                        .cornerRadius(10)
                }
                        .padding()
                        .alert(isPresented: $showingDeleteAlert) {
                            Alert(
                                title: Text("Confirm Account Deletion"),
                                message: Text("Are you sure you want to delete your account permanently? This action cannot be undone."),
                                primaryButton: .destructive(Text("Delete"), action: viewModel.deleteUser),
                                secondaryButton: .cancel()
                            )
                        }
                
                    }
                    .navigationTitle("Profile")
                    .onAppear(perform: viewModel.fetchUser)
                }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)
            .padding()
            .background(Color.blue.opacity(0.1))
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.blue, lineWidth: 2))
            .shadow(radius: 5)

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
