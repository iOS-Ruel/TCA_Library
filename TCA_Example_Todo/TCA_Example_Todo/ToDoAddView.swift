//
//  ToDoAddView.swift
//  TCA_Example_Todo
//
//  Created by Chung Wussup on 8/27/24.
//

import SwiftUI
import ComposableArchitecture

struct ToDoAddView: View {
    let store: StoreOf<Feature>
    @State private var title = ""
    @State private var description = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $title)
                }
                Section(header: Text("Description")) {
                    TextField("Enter description", text: $description)
                }
                Button("Add To-Do") {
                    let newToDo = ToDo(
                        id: UUID(),
                        title: title,
                        description: description
                    )
                    viewStore.send(.addToDo(newToDo))
                    presentationMode.wrappedValue.dismiss() 
                }
            }
            .navigationTitle("Add To-Do")
        }
    }
}
