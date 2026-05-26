//
//  TrainingPlanEntity.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 06/04/26.
//
import SwiftData
import Foundation

@Model
class TrainingPlanEntity {
    @Attribute(.unique) var id: UUID
    var userId: UUID
    var title: String
    var targetDescription: String
    var targetDistance: Double
    var targetPace: String
    var totalWeeks: Int
    var raceDate: Date
    var user: UserEntity?

    // A training plan owns the weekly buckets shown on the overview screen.
    @Relationship(deleteRule: .cascade, inverse: \TrainingPlanWeeklyEntity.plan)
    var weeks: [TrainingPlanWeeklyEntity]

    init(
        userId: UUID,
        title: String,
        targetDescription: String,
        targetDistance: Double,
        targetPace: String,
        totalWeeks: Int,
        raceDate: Date,
        user: UserEntity? = nil,
        weeks: [TrainingPlanWeeklyEntity] = []
    ) {
        self.id = UUID()
        self.userId = userId
        self.title = title
        self.targetDescription = targetDescription
        self.targetDistance = targetDistance
        self.targetPace = targetPace
        self.totalWeeks = totalWeeks
        self.raceDate = raceDate
        self.user = user
        self.weeks = weeks
    }
}

enum TrainingType: String, Codable, CaseIterable {
    case easyRun
    case longRun
    case tempoRun
    case thresholdRun
    case strengthLower
    case strengthCore
}
