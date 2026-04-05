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
    case home
}

final class AppCoordinator: ObservableObject {
    @Published var flow: AppFlow = .onBoarding
    
    func didLogin() {
        flow = .home
    }
    
    func logout() {
        flow = .onBoarding
    }
}

struct AppRootView:View {
    var flow: AppFlow
    
    var body: some View {
        switch flow {
        case .home:
            WelcomeView()
        case .onBoarding:
            WelcomeView()
        }
    }
}
