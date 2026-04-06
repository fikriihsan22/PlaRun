//
//  TrainingPlanRepository.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 06/04/26.
//
import Foundation

class TrainingPlanRepository {
    let trainingPlanLocalDS: TrainingPlanLocalDataSource

    init(_ trainingPlanLocalDS: TrainingPlanLocalDataSource) {
        self.trainingPlanLocalDS = trainingPlanLocalDS
    }

    func fetchTrainingPlans() -> [TrainingPlanEntity] {
        trainingPlanLocalDS.fetchAll()
    }

}
