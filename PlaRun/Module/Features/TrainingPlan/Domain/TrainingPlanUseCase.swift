//
//  TrainingPlanUseCase.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 14/04/26.
//

struct TrainingPlanUseCase {
    private let sessionManager: SessionManager

    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
}

//MARK: TRAINING LIST
extension TrainingPlanUseCase: TrainingListUseCase {
    func getUserNickName() -> String? {
        return sessionManager.getSession()?.nickname
    }
    
    func getUserEmail() -> String? {
        return sessionManager.getSession()?.email
    }
}

protocol TrainingListUseCase: UserDataProviding {

}

protocol UserDataProviding {
    func getUserNickName() -> String?
    func getUserEmail() -> String?
}
