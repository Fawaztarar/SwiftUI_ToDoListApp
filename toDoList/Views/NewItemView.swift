
//
//  NewItemView.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//


import SwiftUI

struct NewItemView: View {
    @ObservedObject var viewModel = NewItemViewViewModel()
    @Binding var newitemPresented: Bool

    
    var body: some View {
        VStack {
            Text("Add a new item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
                
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                    
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Spacer() // Add space above the button
                
                Button(action: {
                    if viewModel.canSave {
                        viewModel.save()
                        newitemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }) {
                    Text("Save")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .cornerRadius(10)
                }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Error"), message: Text("Please enter a title and a due date not be in past"), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newitemPresented: Binding(get: {
            return true }, set: { _ in }))
    }
}
