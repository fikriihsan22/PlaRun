//
//  UserLocalDataSource.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 07/04/26.
//

import SwiftData
import Foundation

class UserLocalDataSource {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func fetchAll() -> [UserEntity] {
        let descriptor = FetchDescriptor<UserEntity>()
        return (try? context.fetch(descriptor)) ?? []
    }

    func save(_ trainingPlan: UserEntity) {
        context.insert(trainingPlan)
    }

    func delete(_ trainingPlan: UserEntity) {
        context.delete(trainingPlan)
    }
}
