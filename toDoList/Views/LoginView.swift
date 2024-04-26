//
//  LoginView.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("To Do Manager ")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .padding(.bottom, 1)

                Text("Get your tasks done")
                    .font(.system(size: 25))
                    .foregroundColor(.gray)
                    .padding(.bottom, 120)
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .padding(.bottom, 20)
                }
                       
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
                    viewModel.login()
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Button(action: {
                                   // Implement guest login logic here
                                   viewModel.loginAsGuest()
                               }) {
                                   Text("Continue as Guest")
                                       .foregroundColor(.white)
                                       .padding()
                                       .frame(maxWidth: .infinity)
                                       .background(Color.green) // Change color as needed
                                       .cornerRadius(10)
                               }
                .padding(.horizontal)

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





// import SwiftUI

// struct LoginView: View {
//     @ObservedObject var viewModel = LoginViewViewModel()
    
//     var body: some View {
//         NavigationView {
//             VStack {
//                 Text("To Do Manager ")
//                     .font(.system(size: 40))
//                     .fontWeight(.bold)
//                     .padding(.bottom, 1)

//                 Text("Get your tasks done")
//                     .font(.system(size: 25))
//                     .foregroundColor(.gray)
//                     .padding(.bottom, 120)
                
//                 if !viewModel.errorMessage.isEmpty {
//                     Text(viewModel.errorMessage)
//                         .foregroundColor(.red)
//                         .padding(.bottom, 20)
//                 }
                       
//                 TextField("Email", text: $viewModel.email)
//                     .textFieldStyle(RoundedBorderTextFieldStyle())
//                     .keyboardType(.emailAddress)
//                     .autocapitalization(.none)
//                     .disableAutocorrection(true)    
//                     .padding(.horizontal)
//                     .padding(.bottom, 10)
                
//                 SecureField("Password", text: $viewModel.password)
//                     .textFieldStyle(RoundedBorderTextFieldStyle())
//                     .padding(.horizontal)
//                     .padding(.bottom, 20)
                
//                 Button(action: {
//                     viewModel.login()
//                 }) {
//                     Text("Login")
//                         .foregroundColor(.white)
//                         .padding()
//                         .frame(maxWidth: .infinity)
//                         .background(Color.blue)
//                         .cornerRadius(10)
//                 }
//                 .padding(.horizontal)

//                 Text("Don't have an account?")
//                     .foregroundColor(.gray)
//                     .padding(.top, 20)
                
//                 NavigationLink("Create an Account", destination: RegisterView()) 
//                     .foregroundColor(.blue)
//                     .padding(.bottom, 20)
                
//             }
//         }
//     }
// }

// struct LoginView_Previews: PreviewProvider {
//     static var previews: some View {
//         LoginView()
//     }
// }




