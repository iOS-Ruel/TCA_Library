//
//  ContentView.swift
//  TCA_Example_Todo
//
//  Created by Chung Wussup on 8/27/24.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    
    var body: some View {
        ToDoListView(store: Store(initialState: Feature.State(), reducer: {
            Feature()
        }))
    }
}

#Preview {
    ContentView()
}
