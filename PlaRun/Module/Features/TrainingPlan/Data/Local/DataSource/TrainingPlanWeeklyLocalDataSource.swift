//
//  TrainingPlanWeeklyLocalDataSource.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 07/04/26.
//

import SwiftData
import Foundation

class TrainingPlanWeeklyLocalDataSource {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func fetchAll() -> [TrainingPlanWeeklyEntity] {
        let descriptor = FetchDescriptor<TrainingPlanWeeklyEntity>()
        return (try? context.fetch(descriptor)) ?? []
    }

    func save(_ trainingPlan: TrainingPlanWeeklyEntity) {
        context.insert(trainingPlan)
    }

    func delete(_ trainingPlan: TrainingPlanWeeklyEntity) {
        context.delete(trainingPlan)
    }
}
