//
//  CounterFeature.swift
//  TCA_Tutorial
//
//  Created by Chung Wussup on 8/10/24.
//

import Foundation
import ComposableArchitecture

//count -> 도메인
struct Feature: Reducer {
    @ObservableState
    struct State: Equatable {
        var count = 0
    }
    
    enum Action {
        case plusButtonTap
        case minusButtonTap
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .plusButtonTap:
            // 더하기 작업 구현
            state.count += 1
            return .none
        case .minusButtonTap:
            // 빼기 작업 구현
            state.count -= 1
            return .none
        }
    }
    
    // Parent로서 동작할 경우
    /*
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
                
            }
        }
    }
    */
}


