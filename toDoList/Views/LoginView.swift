//
//  LoginView.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                // Heading Text "To Do List" subheading "Get your tasks done"
                Text("To Do Manager ")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 25)

                Text("Get your tasks done")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
            

                // text fields for email and password with login button    
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                
                Button(action: {
                    // Perform login action
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                // Bottom Text "Don't have an account? Sign Up" with button to navigate to SignUpView
                Text("Don't have an account?")
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                
                NavigationLink("Create an Account", destination: RegisterView()) 
                    .foregroundColor(.blue)
                    .padding(.bottom, 20)
                
            }
          
        }
    
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


