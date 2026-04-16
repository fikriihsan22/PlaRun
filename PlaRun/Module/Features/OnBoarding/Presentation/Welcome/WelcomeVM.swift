//
//  WelcomeViewModel.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 08/04/26.
//

protocol WelcomeVMProtocol {
    func createNewUser()
}

struct WelcomeVM: WelcomeVMProtocol {
    let sessionManager: SessionManaging

    func createNewUser() {

    }
}

struct WelcomeVMMock: WelcomeVMProtocol {
    let useCase: WelcomeUseCaseProtocol

    func createNewUser() {
        useCase.createNewUserSession(email: "fikri@gmail.com", nickname: "pikron")
    }
}
