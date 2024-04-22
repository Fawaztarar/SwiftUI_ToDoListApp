// import SwiftUI

// struct RegisterView: View {
//     @StateObject var viewModel = RegisterViewViewModel() 


//     var body: some View {
//         NavigationView {
//             VStack {
//                 Text("Register")
//                     .font(.system(size: 40))
//                     .fontWeight(.bold)
//                     .padding(.bottom, 1)
                
//                 Text("Start managing your tasks")
//                     .font(.system(size: 25))
//                     .foregroundColor(.gray)
//                     .padding(.bottom, 120)
                
//                 // Form with "Name", "Email", "Password" fields
//                 // and a "Create Account" button
//                 Form {
//                     Section {
//                         TextField("Name", text: $viewModel.name)
//                             .textFieldStyle(DefaultTextFieldStyle())
//                             .disableAutocorrection(true)
//                             .autocapitalization(.none)
                        
//                         TextField("Email", text: $viewModel.email)
//                             .textFieldStyle(DefaultTextFieldStyle())
//                             .keyboardType(.emailAddress)
//                             .autocapitalization(.none)
//                             .disableAutocorrection(true)

                        
//                         SecureField("Password", text: $viewModel.password)
//                             .textFieldStyle(DefaultTextFieldStyle())
                        
//                     }
                    
//                     Section {
//                         Button(action: {
//                             viewModel.register()
//                         }) {
//                             Text("Create Account")
//                                 .foregroundColor(.white)
//                                 .padding()
//                                 .frame(maxWidth: .infinity)
//                                 .background(Color.green)
//                                 .cornerRadius(10)
//                         }
//                     }
//                 }
//             }
//         }
//     }
// }

// struct RegisterView_Previews: PreviewProvider {
//     static var previews: some View {
//         RegisterView()
//     }
// }






import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel() 

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Spacer(minLength: 60) // Adds spacing at the top

                Text("Register")
                    .font(.largeTitle) // Adjusts for dynamic type
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                Text("Start managing your tasks")
                    .font(.title2) // Adjusts for dynamic type
                    .foregroundColor(.secondary) // Less focus than the title
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        TextField("Name", text: $viewModel.name)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))

                        TextField("Email", text: $viewModel.email)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)

                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    }
                    .padding(.horizontal)
                }
                
                Button(action: viewModel.register) {
                    Text("Create Account")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(8)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)

                Spacer() // Pushes everything to the top
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color(.systemGray5), Color.white]), startPoint: .top, endPoint: .bottom)) // Gradient background
            .edgesIgnoringSafeArea(.all)
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Handles the navigation style
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
