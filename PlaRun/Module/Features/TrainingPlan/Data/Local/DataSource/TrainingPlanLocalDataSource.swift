//
//  TrainingPlanLocalDataSource.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 06/04/26.
//
import SwiftData
import Foundation

class TrainingPlanLocalDataSource {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func fetchAll() -> [TrainingPlanEntity] {
        let descriptor = FetchDescriptor<TrainingPlanEntity>()
        return (try? context.fetch(descriptor)) ?? []
    }

    func save(_ trainingPlan: TrainingPlanEntity) {
        context.insert(trainingPlan)
    }

    func delete(_ trainingPlan: TrainingPlanEntity) {
        context.delete(trainingPlan)
    }

    func update(id: UUID,trainingPlan: TrainingPlanEntity) {
        let descripton = FetchDescriptor<TrainingPlanEntity>(
            predicate: #Predicate{ $0.id == id }
        )

        if let data = try? context.fetch(descripton).first {
            data.date = trainingPlan.date
            data.note = trainingPlan.note
            data.title = trainingPlan.title
            data.type = trainingPlan.type
            data.isComplete = trainingPlan.isComplete
            data.distance = trainingPlan.distance
            data.distanceUnit = trainingPlan.distanceUnit

        }
    }
}
