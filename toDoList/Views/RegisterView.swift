//
//  RegisterView.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Register")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .padding(.bottom, 1)
                
                Text("Start managing your tasks")
                    .font(.system(size: 25))
                    .foregroundColor(.gray)
                    .padding(.bottom, 120)
                
                // Form with "Name", "Email", "Password", and "Confirm Password" fields
                // and a "Create Account" button
                Form {
                    Section {
                        TextField("Name", text: $name)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        
                        TextField("Email", text: $email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)

                        
                        SecureField("Password", text: $password)
                            .textFieldStyle(DefaultTextFieldStyle())
                        
                        SecureField("Confirm Password", text: $confirmPassword)
                            .textFieldStyle(DefaultTextFieldStyle())
                    }
                    
                    Section {
                        Button(action: {
                            // Perform registration action
                        }) {
                            Text("Create Account")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
