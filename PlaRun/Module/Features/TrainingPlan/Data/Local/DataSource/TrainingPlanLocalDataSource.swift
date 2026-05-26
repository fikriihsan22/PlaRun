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
        let descriptor = FetchDescriptor<TrainingPlanEntity>(
            sortBy: [SortDescriptor(\.raceDate)]
        )
        return (try? context.fetch(descriptor)) ?? []
    }

    func fetchByUserId(_ userId: UUID) -> [TrainingPlanEntity] {
        let descriptor = FetchDescriptor<TrainingPlanEntity>(
            predicate: #Predicate { $0.userId == userId },
            sortBy: [SortDescriptor(\.raceDate)]
        )
        return (try? context.fetch(descriptor)) ?? []
    }

    func fetchById(_ id: UUID) -> TrainingPlanEntity? {
        let descriptor = FetchDescriptor<TrainingPlanEntity>(
            predicate: #Predicate { $0.id == id }
        )
        return try? context.fetch(descriptor).first
    }

    func save(_ trainingPlan: TrainingPlanEntity) {
        context.insert(trainingPlan)
    }

    func delete(_ trainingPlan: TrainingPlanEntity) {
        context.delete(trainingPlan)
    }

    func update(id: UUID, trainingPlan: TrainingPlanEntity) {
        guard let data = fetchById(id) else { return }

        // Only update plan metadata here; weekly/workout data has its own data source.
        data.title = trainingPlan.title
        data.targetDescription = trainingPlan.targetDescription
        data.targetDistance = trainingPlan.targetDistance
        data.targetDistanceUnit = trainingPlan.targetDistanceUnit
        data.targetPace = trainingPlan.targetPace
        data.totalWeeks = trainingPlan.totalWeeks
        data.raceDate = trainingPlan.raceDate
    }
}
