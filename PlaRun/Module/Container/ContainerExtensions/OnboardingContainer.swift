//
//  WelcomeContainer.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 13/04/26.
//

protocol OnboardingContainerProtocol {
    func getWelcomeViewModel() -> WelcomeVMProtocol
}

extension AppContainer: OnboardingContainerProtocol {
    func getWelcomeViewModel() -> WelcomeVMProtocol {
        let vm = WelcomeVMMock(useCase: OnboardingUseCase(sessionManager: sessionManager))
        return vm
    }
}
