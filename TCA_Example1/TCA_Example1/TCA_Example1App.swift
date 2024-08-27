//
//  TCA_Example1App.swift
//  TCA_Example1
//
//  Created by Chung Wussup on 8/19/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_Example1App: App {
    static let store = Store(initialState: CounterFeature.State()) {
       CounterFeature()
            ._printChanges()
     }
     
     var body: some Scene {
       WindowGroup {
           CounterView(store: TCA_Example1App.store)
       }
     }
}
