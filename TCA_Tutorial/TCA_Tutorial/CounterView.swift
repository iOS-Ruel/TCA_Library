//
//  ContentView.swift
//  TCA_Tutorial
//
//  Created by Chung Wussup on 8/10/24.
//

import SwiftUI
import ComposableArchitecture

struct CounterView: View {
    let store: StoreOf<Feature>
    
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Text("\(viewStore.count)")
                    .font(.title)
                
                HStack {
                    Button("-") {
                        // - Action
                        viewStore.send(.minusButtonTap)
                    }
                    Button("+"){
                        // - Action
                        viewStore.send(.plusButtonTap)
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        
    }
}

#Preview {
    CounterView(
        store: Store(initialState: Feature.State(), reducer: {
            Feature()
        })
    )
}
