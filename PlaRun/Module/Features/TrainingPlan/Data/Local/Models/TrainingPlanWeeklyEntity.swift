//
//  TrainingPlanWeeklyEntity.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 07/04/26.
//
import SwiftData
import Foundation

@Model
class TrainingPlanWeeklyEntity {
    @Attribute(.unique) var id: UUID
    var planId: UUID
    var userId: UUID
    var weekNumber: Int
    var fromDate: Date
    var endDate: Date
    var plan: TrainingPlanEntity?

    // Workouts are stored under a week so the weekly card/detail screen can read one bucket.
    @Relationship(deleteRule: .cascade, inverse: \TrainingWorkoutEntity.week)
    var workouts: [TrainingWorkoutEntity]

    var completedWorkoutCount: Int {
        workouts.filter { $0.isComplete }.count
    }

    var totalWorkoutCount: Int {
        workouts.count
    }

    var totalDistance: Double {
        workouts.reduce(0) { total, workout in
            total + (workout.distance ?? 0)
        }
    }

    init(
        planId: UUID,
        userId: UUID,
        weekNumber: Int,
        fromDate: Date,
        endDate: Date,
        workouts: [TrainingWorkoutEntity] = []
    ) {
        self.id = UUID()
        self.planId = planId
        self.userId = userId
        self.weekNumber = weekNumber
        self.fromDate = fromDate
        self.endDate = endDate
        self.workouts = workouts
    }
}

@Model
class TrainingWorkoutEntity {
    @Attribute(.unique) var id: UUID
    var planId: UUID
    var weekId: UUID
    var userId: UUID
    var date: Date
    var title: String
    var note: String
    var type: TrainingType
    var isComplete: Bool
    var distance: Double?
    var distanceUnit: String
    var sortOrder: Int
    var week: TrainingPlanWeeklyEntity?

    init(
        planId: UUID,
        weekId: UUID,
        userId: UUID,
        date: Date,
        title: String,
        note: String,
        type: TrainingType,
        isComplete: Bool = false,
        distance: Double? = nil,
        distanceUnit: String = "KM",
        sortOrder: Int = 0
    ) {
        self.id = UUID()
        self.planId = planId
        self.weekId = weekId
        self.userId = userId
        self.date = date
        self.title = title
        self.note = note
        self.type = type
        self.isComplete = isComplete
        self.distance = distance
        self.distanceUnit = distanceUnit
        self.sortOrder = sortOrder
    }
}
