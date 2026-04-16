//
//  KeychainStorage.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 07/04/26.
//
import Foundation
import Security

protocol KeychainStorable {
    func save(_ data: Data, forKey key: String)
    func load(_ key: String) -> Data?
    func delete(_ key: String)
}

final class KeychainStorage: KeychainStorable {
    func save(_ data: Data, forKey key: String) {
        delete(key)

        let query: [String:Any] = [
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccount as String : key,
            kSecValueData as String : data,
        ]

        SecItemAdd(query as CFDictionary, nil)

    }

    func load(_ key: String) -> Data? {
        let query: [String:Any] = [
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccount as String : key,
            kSecReturnData as String : true,
            kSecMatchLimit as String : kSecMatchLimitOne
        ]

        var result: AnyObject?
        SecItemCopyMatching(query as CFDictionary, &result)

        return result as? Data
    }

    func delete(_ key: String) {
        let query: [String:Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]

        SecItemDelete(query as CFDictionary)
    }
}
