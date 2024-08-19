//
//  TCA_TutorialApp.swift
//  TCA_Tutorial
//
//  Created by Chung Wussup on 8/10/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_TutorialApp: App {
    var body: some Scene {
        WindowGroup {
            CounterView(store: Store(initialState: Feature.State(), reducer: {
                            Feature()
                        }))
        }
              
    }
}
