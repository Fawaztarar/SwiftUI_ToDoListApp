import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel() 


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
                
                // Form with "Name", "Email", "Password" fields
                // and a "Create Account" button
                Form {
                    Section {
                        TextField("Name", text: $viewModel.name)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        
                        TextField("Email", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)

                        
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                        
                    }
                    
                    Section {
                        Button(action: {
                            viewModel.register()
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




