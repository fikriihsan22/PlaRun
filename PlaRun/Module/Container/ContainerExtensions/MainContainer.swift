//
//  MainContainer.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 13/04/26.
//

protocol MainContainer {
    func getTrainingListViewModel() -> TrainingListVM
}

extension AppContainer: MainContainer {
    func getTrainingListViewModel() -> TrainingListVM {
        return TrainingListVM(useCase: TrainingPlanUseCase(sessionManager: sessionManager))
    }
}
