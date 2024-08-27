//
//  TCA_Example1Tests.swift
//  TCA_Example1Tests
//
//  Created by Chung Wussup on 8/19/24.
//
import ComposableArchitecture
import XCTest

@testable import TCA_Example1

@MainActor
final class TCA_Example1Tests: XCTestCase {
    //    func testCounter() async {
    //        let store = TestStore(initialState: CounterFeature.State()) {
    //          CounterFeature()
    //        }
    //
    //        await store.send(.incrementButtonTapped) {
    //            $0.count = 1
    //        }
    //
    //        await store.send(.decrementButtonTapped) {
    //            $0.count = 0
    //        }
    //    }
    let clock = TestClock()
    func testTimer() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        } withDependencies: {
            $0.continuousClock = clock
          }
        
        
        await store.send(.toggleTimerButtonTapped) {
          $0.isTimerRunning = true
        }
        await clock.advance(by: .seconds(1))
        await store.receive(\.timerTick) {
          $0.count = 1
        }
        await store.send(.toggleTimerButtonTapped) {
          $0.isTimerRunning = false
        }
    }
}
