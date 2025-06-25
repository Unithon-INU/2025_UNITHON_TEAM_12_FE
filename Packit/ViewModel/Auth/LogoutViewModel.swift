//
//  LogoutViewModel.swift
//  Packit
//
//  Created by 이예나 on 6/25/25.
//
import Foundation

final class LogoutViewModel: ObservableObject {
    private var authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol=AuthService()) {
        self.authService = authService
    }
    
    // MARK: - 회원가입 API
    func logout() async -> Bool {
        let result = await authService.logout(void: ())
        
        switch result {
        case .success(let data, _):
            print(data.message)
            return true
        case .failure(let statusCode, let message):
            print("[logout] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
            return false
        }
    }
}
