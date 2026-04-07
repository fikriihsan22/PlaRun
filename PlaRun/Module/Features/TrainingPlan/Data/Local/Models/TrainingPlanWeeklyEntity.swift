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
    var week: Int
    var fromDate: Date
    var endDate: Date
    var userId: UUID

    init(userId:UUID, week: Int, fromDate: Date, endDate: Date) {
        self.userId = userId
        self.week = week
        self.fromDate = fromDate
        self.endDate = endDate
    }
}
