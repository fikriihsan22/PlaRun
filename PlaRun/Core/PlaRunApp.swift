//
//  PlaRunApp.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 19/03/26.
//

import SwiftUI
import SwiftData

@main
struct PlaRunApp: App {
    private var isLoggin = false //Mock Only
    private let sessionManager = SessionManager(KeychainStorage())

    var body: some Scene {
        WindowGroup {
            AppCoordinator(flow: isUserLoggedIn() ? .main : .onBoarding,
                           sessionManager: sessionManager,
                           container: AppContainer(sessionManager)).start()
            // Register local database models once at the app root.
                .modelContainer(for: [
                    UserEntity.self,
                    TrainingPlanEntity.self,
                    TrainingPlanWeeklyEntity.self,
                    TrainingWorkoutEntity.self,
                    TrainingTypeEntity.self
                ])
        }
    }

    func isUserLoggedIn() -> Bool {
        return sessionManager.getSession() != nil
    }
}
