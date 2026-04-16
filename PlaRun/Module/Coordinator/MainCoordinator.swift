//
//  MainCoordinator.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 13/04/26.
//
import SwiftUI

final class MainCoordinator {
    let container: MainContainer
    let session: SessionManager
    let onLogout: () -> Void

    init(container: AppContainer, session: SessionManager, onLogout: @escaping () -> Void) {
        self.container = container
        self.session = session
        self.onLogout = onLogout
    }

    func start() -> some View {
        TrainingListView(viewModel: container.getTrainingListViewModel())
    }
}


