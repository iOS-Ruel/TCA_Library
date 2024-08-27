//
//  ToDoListView.swift
//  TCA_Example_Todo
//
//  Created by Chung Wussup on 8/27/24.
//

import SwiftUI
import ComposableArchitecture

struct ToDoListView: View {
    let store: StoreOf<Feature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationView {
                List {
                    ForEach(viewStore.todos) { todo in
                        NavigationLink(
                            destination: ToDoDetailView(store: self.store, todo: todo)) {
                                Text(todo.title)
                            }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let id = viewStore.todos[index].id
                            viewStore.send(.removeToDo(id))
                        }
                    }
                }
                .navigationTitle("To-Do List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink("Add") {
                            ToDoAddView(store: self.store)
                        }
                    }
                }
            }
            
        }
    }
}

//#Preview {
//    ToDoListView()
//}
