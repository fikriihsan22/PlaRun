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
    var id: UUID
    var nickname: String
    var email: String

    init(nickname: String, email: String) {
        self.id = UUID()
        self.nickname = nickname
        self.email = email
    }
}
