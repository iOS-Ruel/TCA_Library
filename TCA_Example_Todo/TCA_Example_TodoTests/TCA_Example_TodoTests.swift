//
//  ㅁㄴㅇㄹ.swift
//  TCA_Example_TodoTests
//
//  Created by Chung Wussup on 8/27/24.
//
import XCTest
import ComposableArchitecture

@testable import TCA_Example_Todo

final class TCA_Example_TodoTests: XCTestCase {
    
    func testAddToDo() async {
        let store = TestStore(initialState: Feature.State(), reducer: {
            Feature()
        })
        
        let newToDo = ToDo(
            id: UUID(),
            title: "Test To-Do",
            description: "Test Description"
        )
        
        await store.send(.addToDo(newToDo)) {
            $0.todos.append(newToDo)
        }
    }
    
    func testRemoveToDo() async {
        let todo = ToDo(
            id: UUID(),
            title: "Test To-Do",
            description: "Test Description"
        )
        
        let store = TestStore(initialState: Feature.State(todos: [todo]), reducer: {
            Feature()
        })
        
        await store.send(.removeToDo(todo.id)) {
            $0.todos.removeAll { $0.id == todo.id }
        }
    }
    
    func testSelectToDo() async {
        let todo1 = ToDo(
            id: UUID(),
            title: "Test To-Do 1",
            description: "Test Description 1"
        )
        
        let todo2 = ToDo(
            id: UUID(),
            title: "Test To-Do 2",
            description: "Test Description 2"
        )
        
        let store = TestStore(initialState: Feature.State(todos: [todo1, todo2]), reducer: {
            Feature()
        })
        
        await store.send(.selectToDo(todo1.id)) {
            $0.selectedToDo = todo1
        }
        
        await store.send(.selectToDo(todo2.id)) {
            $0.selectedToDo = todo2
        }
    }
    
    func testUpdateToDo() async {
        let todo = ToDo(
            id: UUID(),
            title: "Test To-Do",
            description: "Test Description"
        )
        
        let updatedToDo = ToDo(
            id: todo.id,
            title: "Updated To-Do",
            description: "Updated Description"
        )
        
        let store = TestStore(initialState: Feature.State(todos: [todo]), reducer: {
            Feature()
        })
        
        await store.send(.updateToDo(updatedToDo)) {
            $0.todos[0] = updatedToDo
        }
        
        XCTAssertEqual(store.state.todos.first?.title, "Updated To-Do")
        XCTAssertEqual(store.state.todos.first?.description, "Updated Description")
    }
    
    func testRemoveNonExistentToDo() async {
        let todo = ToDo(
            id: UUID(),
            title: "Test To-Do",
            description: "Test Description"
        )
        
        let store = TestStore(initialState: Feature.State(todos: [todo]), reducer: {
            Feature()
        })
        
        // 존재하지 않는 To-Do 항목을 삭제하려고 시도합니다.
        let nonExistentId = UUID()
        await store.send(.removeToDo(nonExistentId)) {
            // 상태가 변하지 않아야 합니다.
            XCTAssertEqual($0.todos.count, 1)
        }
    }
    
    func testAddDuplicateToDo() async {
        let todo = ToDo(
            id: UUID(),
            title: "Test To-Do",
            description: "Test Description"
        )
        
        let store = TestStore(initialState: Feature.State(todos: [todo]), reducer: {
            Feature()
        })
        
        // 동일한 ID의 To-Do 항목을 중복으로 추가합니다.
        await store.send(.addToDo(todo)) {
            // 상태가 변하지 않아야 합니다.
            XCTAssertEqual($0.todos.count, 1)
        }
    }
}
