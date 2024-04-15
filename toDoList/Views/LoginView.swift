//
//  LoginView.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//
import SwiftUI
struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                
                // Heading Text "To Do List" subheading "Get your tasks done"
                Text("To Do Manager ")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .padding(.bottom, 1)

                Text("Get your tasks done")
                    .font(.system(size: 25))
                    .foregroundColor(.gray)
                    .padding(.bottom, 120)
                       
                

                // text fields for email and password with login button    
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)    
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                
                SecureField("Password", text: $viewModel.password)
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

