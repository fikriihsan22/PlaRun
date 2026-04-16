//
//  WelcomeUseCase.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 13/04/26.
//
import Foundation
protocol WelcomeUseCaseProtocol {
    func createNewUserSession(email: String, nickname: String)
}

extension OnboardingUseCase: WelcomeUseCaseProtocol {
    func createNewUserSession(email: String, nickname: String) {
        sessionManager.saveSession(Session(id: UUID(),
                                           email: email,
                                           nickname: nickname))
    }
}
