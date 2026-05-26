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
        let descriptor = FetchDescriptor<TrainingPlanWeeklyEntity>(
            sortBy: [SortDescriptor(\.weekNumber)]
        )
        return (try? context.fetch(descriptor)) ?? []
    }

    func fetchByPlanId(_ planId: UUID) -> [TrainingPlanWeeklyEntity] {
        let descriptor = FetchDescriptor<TrainingPlanWeeklyEntity>(
            predicate: #Predicate { $0.planId == planId },
            sortBy: [SortDescriptor(\.weekNumber)]
        )
        return (try? context.fetch(descriptor)) ?? []
    }

    func fetchByUserId(_ userId: UUID) -> [TrainingPlanWeeklyEntity] {
        let descriptor = FetchDescriptor<TrainingPlanWeeklyEntity>(
            predicate: #Predicate { $0.userId == userId },
            sortBy: [SortDescriptor(\.fromDate)]
        )
        return (try? context.fetch(descriptor)) ?? []
    }

    func fetchById(_ id: UUID) -> TrainingPlanWeeklyEntity? {
        let descriptor = FetchDescriptor<TrainingPlanWeeklyEntity>(
            predicate: #Predicate { $0.id == id }
        )
        return try? context.fetch(descriptor).first
    }

    func save(_ trainingPlan: TrainingPlanWeeklyEntity) {
        context.insert(trainingPlan)
    }

    func delete(_ trainingPlan: TrainingPlanWeeklyEntity) {
        context.delete(trainingPlan)
    }

    func update(id: UUID, trainingPlan: TrainingPlanWeeklyEntity) {
        guard let data = fetchById(id) else { return }

        // Week metadata changes should not rebuild workouts; those are edited separately.
        data.weekNumber = trainingPlan.weekNumber
        data.fromDate = trainingPlan.fromDate
        data.endDate = trainingPlan.endDate
    }
}

class TrainingWorkoutLocalDataSource {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func fetchByWeekId(_ weekId: UUID) -> [TrainingWorkoutEntity] {
        let descriptor = FetchDescriptor<TrainingWorkoutEntity>(
            predicate: #Predicate { $0.weekId == weekId },
            sortBy: [
                SortDescriptor(\.date),
                SortDescriptor(\.sortOrder)
            ]
        )
        return (try? context.fetch(descriptor)) ?? []
    }

    func fetchByDateRange(userId: UUID, fromDate: Date, endDate: Date) -> [TrainingWorkoutEntity] {
        let descriptor = FetchDescriptor<TrainingWorkoutEntity>(
            predicate: #Predicate {
                $0.userId == userId && $0.date >= fromDate && $0.date <= endDate
            },
            sortBy: [
                SortDescriptor(\.date),
                SortDescriptor(\.sortOrder)
            ]
        )
        return (try? context.fetch(descriptor)) ?? []
    }

    func save(_ workout: TrainingWorkoutEntity) {
        context.insert(workout)
    }

    func delete(_ workout: TrainingWorkoutEntity) {
        context.delete(workout)
    }

    func update(id: UUID, workout: TrainingWorkoutEntity) {
        let descriptor = FetchDescriptor<TrainingWorkoutEntity>(
            predicate: #Predicate { $0.id == id }
        )

        guard let data = try? context.fetch(descriptor).first else { return }

        // User-entered workout fields map to the add/edit workout wireframe.
        data.date = workout.date
        data.title = workout.title
        data.note = workout.note
        data.type = workout.type
        data.isComplete = workout.isComplete
        data.distance = workout.distance
        data.distanceUnit = workout.distanceUnit
        data.sortOrder = workout.sortOrder
    }
}
