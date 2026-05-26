//
//  UserEntity.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 07/04/26.
//
import SwiftData
import Foundation

@Model
class UserEntity {
    @Attribute(.unique) var id: UUID
    @Attribute(.unique) var email: String
    var nickname: String
    var createdAt: Date
    var updatedAt: Date
    var activePlanId: UUID?
    var preferredDistanceUnit: String
    var preferredPaceUnit: String

    // User is the root owner for training plans in the local database.
    @Relationship(deleteRule: .cascade, inverse: \TrainingPlanEntity.user)
    var trainingPlans: [TrainingPlanEntity]

    init(
        id: UUID = UUID(),
        nickname: String,
        email: String,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        activePlanId: UUID? = nil,
        preferredDistanceUnit: String = "KM",
        preferredPaceUnit: String = "min/km",
        trainingPlans: [TrainingPlanEntity] = []
    ) {
        self.id = id
        self.nickname = nickname
        self.email = email
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.activePlanId = activePlanId
        self.preferredDistanceUnit = preferredDistanceUnit
        self.preferredPaceUnit = preferredPaceUnit
        self.trainingPlans = trainingPlans
    }
}
