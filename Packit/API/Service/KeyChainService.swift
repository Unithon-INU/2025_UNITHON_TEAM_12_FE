//
//  KeyChainService.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

class KeychainManager {
    enum KeychainError: Error {
        case duplicateEntry
        case noToken
        case unknown(OSStatus)
    }
    
    static func save(studentId: String, token: Data) throws {
        if get() != nil {
            try delete()
        }
        
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: studentId as NSString,
            kSecValueData as String: token as NSData
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            if status == errSecDuplicateItem {
                throw KeychainError.duplicateEntry
            } else {
                throw KeychainError.unknown(status)
            }
        }
    }
    
    static func get() -> (userId: String, token: String)? {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecReturnAttributes as String: kCFBooleanTrue,
            kSecReturnData as String: kCFBooleanTrue,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: CFTypeRef?
        _ = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard let data = result as? [String: AnyObject],
              let tokenData = data[kSecValueData as String] as? Data,
              let token = String(data: tokenData, encoding: String.Encoding.utf8),
              let studentId = data[kSecAttrAccount as String] as? String
                else { return nil }
                
        return (studentId, token)
    }
    
    static func delete() throws {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        guard status != errSecItemNotFound else { throw KeychainError.noToken}
        guard status == errSecSuccess else { throw KeychainError.unknown(status)}
    }
    
}

extension KeychainManager {
    static func getToken() -> String? {
        return get()?.token
    }
}
