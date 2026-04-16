//
//  OnboardingUseCase.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 08/04/26.
//
import Foundation
protocol OnboardingUseCaseProtocol {
    func createNewUserSession() -> Session
}

class OnboardingUseCase {
    let sessionManager: SessionManaging

    init(sessionManager: SessionManaging) {
        self.sessionManager = sessionManager
    }
}
