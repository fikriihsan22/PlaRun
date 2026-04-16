//
//  AppCoordinator.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 25/03/26.
//
import SwiftUI
import Combine

enum AppFlow {
    case onBoarding
    case main
}

final class AppCoordinator: ObservableObject {
    @Published var flow: AppFlow
    let sessionManager: SessionManager
    var container: AppContainer

    init(flow: AppFlow, sessionManager: SessionManager, container: AppContainer) {
        self.flow = flow
        self.sessionManager = sessionManager
        self.container = container
    }

    @ViewBuilder
    func start() -> some View {
        switch flow {
        case .onBoarding:
            OnboardingCoordinator(container: container, session: sessionManager) {[weak self] in
                self?.flow = .main
            }.start()

        case .main:
            MainCoordinator(container: container, session: sessionManager) {[weak self] in
                self?.flow = .onBoarding
            }.start()
        }
    }

}
