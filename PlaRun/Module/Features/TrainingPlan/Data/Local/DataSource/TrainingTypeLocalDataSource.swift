//
//  TrainingTypeLocalDataSource.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 06/04/26.
//

import SwiftData
import Foundation

class TrainingTypeLocalDataSource {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func fetchAll() -> [TrainingTypeEntity] {
        let descriptor = FetchDescriptor<TrainingTypeEntity>()
        return (try? context.fetch(descriptor)) ?? []
    }

    func save(_ trainingPlan: TrainingTypeEntity) {
        context.insert(trainingPlan)
    }

    func delete(_ trainingPlan: TrainingTypeEntity) {
        context.delete(trainingPlan)
    }
}
