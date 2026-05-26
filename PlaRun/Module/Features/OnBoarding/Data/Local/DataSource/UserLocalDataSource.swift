//
//  UserLocalDataSource.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 07/04/26.
//

import SwiftData
import Foundation

class UserLocalDataSource {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func fetchAll() -> [UserEntity] {
        let descriptor = FetchDescriptor<UserEntity>(
            sortBy: [SortDescriptor(\.createdAt)]
        )
        return (try? context.fetch(descriptor)) ?? []
    }

    func fetchById(_ id: UUID) -> UserEntity? {
        let descriptor = FetchDescriptor<UserEntity>(
            predicate: #Predicate { $0.id == id }
        )
        return try? context.fetch(descriptor).first
    }

    func fetchByEmail(_ email: String) -> UserEntity? {
        let descriptor = FetchDescriptor<UserEntity>(
            predicate: #Predicate { $0.email == email }
        )
        return try? context.fetch(descriptor).first
    }

    func fetchCurrentUser(session: Session) -> UserEntity? {
        fetchById(session.id) ?? fetchByEmail(session.email)
    }

    func save(_ user: UserEntity) {
        context.insert(user)
    }

    func delete(_ user: UserEntity) {
        context.delete(user)
    }

    func update(id: UUID, user: UserEntity) {
        guard let data = fetchById(id) else { return }

        // Keep mutable profile fields here; training data is owned by training data sources.
        data.nickname = user.nickname
        data.email = user.email
        data.updatedAt = Date()
        data.activePlanId = user.activePlanId
        data.preferredDistanceUnit = user.preferredDistanceUnit
        data.preferredPaceUnit = user.preferredPaceUnit
    }

    @discardableResult
    func upsert(session: Session) -> UserEntity {
        if let existingUser = fetchCurrentUser(session: session) {
            existingUser.nickname = session.nickname
            existingUser.email = session.email
            existingUser.updatedAt = Date()
            return existingUser
        }

        // Session.id and UserEntity.id must match so training tables can use the same userId.
        let newUser = UserEntity(
            id: session.id,
            nickname: session.nickname,
            email: session.email
        )
        context.insert(newUser)
        return newUser
    }
}
