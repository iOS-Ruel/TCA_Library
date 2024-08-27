//
//  ToDoDetailView.swift
//  TCA_Example_Todo
//
//  Created by Chung Wussup on 8/27/24.
//

import SwiftUI
import ComposableArchitecture

struct ToDoDetailView: View {
    let store: StoreOf<Feature>
    let todo: ToDo
    
    var body: some View {
        WithViewStore(store, observe: { $0 } ) { viewStore in
            Form {
                Section(header: Text("Title")) {
                    Text(todo.title)
                }
                Section(header: Text("Description")) {
                    Text(todo.description)
                }
            }
            .navigationTitle("To-Do Details")
        }
    }
}
