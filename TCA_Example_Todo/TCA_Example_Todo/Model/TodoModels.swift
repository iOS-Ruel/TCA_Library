//
//  TodoModels.swift
//  TCA_Example_Todo
//
//  Created by Chung Wussup on 8/27/24.
//

import ComposableArchitecture
import Foundation

struct ToDo: Equatable, Identifiable {
    let id: UUID
    var title: String
    var description: String
}



struct AppEnvironment {
    // 필요한 의존성 추가 가능
    // ex) 예를 들어, API 클라이언트 등
}
