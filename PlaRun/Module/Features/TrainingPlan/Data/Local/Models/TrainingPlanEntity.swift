//
//  TrainingItemModel.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 06/04/26.
//
import SwiftData
import Foundation

@Model
class TrainingPlanEntity {
    var id: UUID
    var type: TrainingTypeEntity
    var date: Date
    var title: String
    var note: String
    var isComplete: Bool
    var distance: Double?
    var distanceUnit: String

    init(type: TrainingTypeEntity, date: Date, title: String, note:String,isComplete:Bool,distance: Double? = nil, distanceUnit: String = "KM") {
        self.id = UUID()
        self.type = type
        self.date = date
        self.title = title
        self.note = note
        self.isComplete = isComplete
        self.distance = distance
        self.distanceUnit = distanceUnit
    }
}
