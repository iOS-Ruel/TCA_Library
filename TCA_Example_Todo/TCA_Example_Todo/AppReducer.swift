//
//  AppReducer.swift
//  TCA_Example_Todo
//
//  Created by Chung Wussup on 8/27/24.
//

import Foundation
import ComposableArchitecture

//Reducer -> 액션이 발생할 때 상태가 어떻게 변경될지 정의

//상태(state), 액션(action), 환경(environment)을 받아서 새로운 상태 반환
//리듀서는 순수 함수로, 상태를 변경하는 모든 로직이 여기에 포함


struct Feature: Reducer {
    @ObservableState
    struct AppState: Equatable {
        var todos: [ToDo] = []
        var selectedToDo: ToDo?
    }

    enum AppAction: Equatable {
        case addToDo(ToDo)
        case removeToDo(UUID)
        case selectToDo(UUID?)
        case updateToDo(ToDo)
    }
    
    func reduce(into state: inout AppState, action: AppAction) -> Effect<AppAction> {
        switch action {
        case .addToDo(let todo):
            state.todos.append(todo)
            return .none
        case .removeToDo(let id):
            state.todos.removeAll { $0.id == id }
            return .none
        case .selectToDo(let id):
            state.selectedToDo = state.todos.first { $0.id == id }
            return .none
        case .updateToDo(let updatedTodo):
            if let index = state.todos.firstIndex(where: { $0.id == updatedTodo.id }) {
                state.todos[index] = updatedTodo
            }
            return .none
        }
    }
    
}
