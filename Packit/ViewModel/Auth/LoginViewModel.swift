//
//  LoginViewModel.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    private var authService: AuthServiceProtocol
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

    var token: String? {
        KeychainManager.getToken()
    }
    
    init(authService: AuthServiceProtocol=AuthService()) {
        self.authService = authService
    }
    
    func signin(email: String, password: String) async -> Bool {
        let result = await authService.signin(email: email, password: password)
        
        switch result {
        case .success(let data, _):
            isLoggedIn = true
            return true
        case .failure(let statusCode, let message):
            print("[signin] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
            return false
        }
    }
}
