//
//  OnboardingCoordinator.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 13/04/26.
//
import SwiftUI

final class OnboardingCoordinator {
    let container: OnboardingContainerProtocol
    let session: SessionManager
    let onFinish: () -> Void

    init(container: AppContainer, session: SessionManager, onFinish: @escaping () -> Void) {
        self.container = container
        self.session = session
        self.onFinish = onFinish    
    }

    func start() -> some View {
        WelcomeView(container.getWelcomeViewModel())
    }
}
