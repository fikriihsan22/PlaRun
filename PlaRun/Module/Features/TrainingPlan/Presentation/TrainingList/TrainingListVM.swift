//
//  TrainingListVM.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 13/04/26.
//
import Foundation
import Combine
import SwiftUI

protocol TrainingListVMProtocol {
    
}

final class TrainingListVM:ObservableObject {
    @Published var nickname: String = ""
    private let useCase: TrainingListUseCase

    init(useCase: TrainingListUseCase) {
        self.useCase = useCase
    }

    func didLoad() {
        nickname = useCase.getUserNickName() ?? "-"
    }

}
