//
//  ToDoListView.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//

import SwiftUI


struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    
    private let userId: String
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to your account!")
            }
            .navigationTitle("To-Do List")
            .toolbar {
                Button(action: {
                    // Add button action here
                    viewModel.isShowingNewItemView = true
                }) {
                    Label("Add", systemImage: "plus")
                }
            }
            .sheet(isPresented: $viewModel.isShowingNewItemView) {
                NewItemView(newitemPresented: $viewModel.isShowingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}
