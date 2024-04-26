//
//  ToDoListitemsView.swift
//  toDoList
//
//  Created by Fawaz Tarar on 15/04/2024.
//

import SwiftUI

struct ToDoListitemsView: View {
    @StateObject var viewModel = ToDoListitemsViewViewModel()
    let item: ToDoListItem
    var body: some View {
        // Hstack and Vstack to display the item with title and due date with timeinterval formatted
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Button {
                // Button action here
                // toggle the isDone property
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(item.isDone ? .blue : .gray)
            }
        }
        
    }
}

#Preview {
    ToDoListitemsView(item: ToDoListItem(id: "123", title: "First Item", dueDate: Date().addingTimeInterval(600).timeIntervalSince1970, createdAt: Date().timeIntervalSince1970, isDone: true))
}
    


