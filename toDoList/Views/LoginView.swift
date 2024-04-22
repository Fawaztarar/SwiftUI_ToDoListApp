//
//  LoginView.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//

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


import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer(minLength: 80) // Adds dynamic spacing at the top
                
                Text("To Do Manager")
                    .font(.largeTitle) // Adapts to user's settings
                    .fontWeight(.heavy) // Heavier weight for a punchier title
                    .padding(.bottom, 2)
                
                Text("Get your tasks done")
                    .font(.title3) // Smaller than the title but still significant
                    .foregroundColor(.secondary) // Softens the color for less distraction
                    .padding(.bottom, 50) // Increase padding for more breathing room
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .padding(.bottom, 20)
                }
                
                TextField("Email", text: $viewModel.email)
                    .padding(12)
                    .background(Color(.systemGray6)) // Subtle background color for TextField
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1)) // Adds border
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)   
                
                SecureField("Password", text: $viewModel.password)
                    .padding(12)
                    .background(Color(.systemGray6)) // Matches TextField style
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                
                Button(action: viewModel.login) {
                    Text("Login")
                        .fontWeight(.medium) // Adds emphasis to the button text
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing)) // Gradient background
                        .cornerRadius(8)
                        .shadow(radius: 5) // Subtle shadow for depth
                }
                .padding(.horizontal, 20)
                
                Spacer(minLength: 30) // Adds dynamic spacing before the account prompt
                
                Text("Don't have an account?")
                    .foregroundColor(.secondary)
                
                NavigationLink("Create an Account", destination: RegisterView())
                    .font(.headline) // Makes the text slightly more prominent
                    .foregroundColor(Color.blue.opacity(0.8)) // A softer blue color
                    .padding(.top, 5)
                
                Spacer(minLength: 30) // Adds dynamic spacing at the bottom
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color(.systemGray5), Color.white]), startPoint: .top, endPoint: .bottom)) // Gradient background for the entire view
            .edgesIgnoringSafeArea(.all) // Extends the background to the edges
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
