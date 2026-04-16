//
//  SessionManager.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 07/04/26.
//
import Foundation
import Security

protocol SessionManaging {
    func saveSession(_ session: Session)
    func getSession() -> Session?
    func clearSession()
}

final class SessionManager: SessionManaging {
    private let nickname_key = "user_nickname_key"
    private let session_key = "user_session_key"
    private let keychain: KeychainStorable

    init(_ keychain: KeychainStorable) {
        self.keychain = keychain
    }

    func saveSession(_ session: Session) {
        let data = try? JSONEncoder().encode(session)
        guard let data = data else { return }
        keychain.save(data, forKey: session_key)
        UserDefaults.standard.set(session.nickname, forKey: nickname_key)
    }

    func getSession() -> Session? {
        let data = keychain.load(session_key)
        guard let data = data else { return nil }
        let session = try? JSONDecoder().decode(Session.self, from: data)
        return session
    }

    func clearSession() {
        keychain.delete(session_key)
    }
}
