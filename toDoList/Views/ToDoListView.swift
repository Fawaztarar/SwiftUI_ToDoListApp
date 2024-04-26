//
//  ToDoListView.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//

import FirebaseFirestoreSwift
import SwiftUI


struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userId: String
    init(userId: String) {
        self.userId = userId
        // Fetch data from server
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue : ToDoListViewViewModel(userId: userId))
        
        
    }
    
    var body: some View {
        NavigationView {
    VStack {
        List(items) { item in
            ToDoListitemsView(item: item)
            .swipeActions {
                Button {
                    viewModel.deleteItem(id: item.id)
                } label: {
                    Label("Delete", systemImage: "trash").tint(.red)
                }
            }
        }
        .listStyle(PlainListStyle())


//        Text("Welcome to your account!")

    }
    .navigationTitle("To-Do List")
    .toolbar {
        Button(action: {
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
        ToDoListView(userId: "rBP6YYvyExRy8B8e6UxsBXmVQQn2")
    }
}


