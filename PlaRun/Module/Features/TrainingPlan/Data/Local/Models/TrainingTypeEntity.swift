//
//  Untitled.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 06/04/26.
//
import SwiftData
import Foundation

@Model
class TrainingTypeEntity {
    var id: UUID
    var name: String
    var hexColor: String

    init(name: String, hexColor: String) {
        self.id = UUID()
        self.name = name
        self.hexColor = hexColor
    }
}
