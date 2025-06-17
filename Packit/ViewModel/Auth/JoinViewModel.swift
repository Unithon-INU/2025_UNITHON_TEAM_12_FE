//
//  JoinViewModel.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

final class JoinViewModel: ObservableObject {
    private var authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol=AuthService()) {
        self.authService = authService
    }
    
    // MARK: - 회원가입 API
    func signup(body: JoinReqDto) async -> Bool {
        let result = await authService.signup(body: body)
        
        switch result {
        case .success(let data, _):
            print(data.message)
            return true
        case .failure(let statusCode, let message):
            print("[signup] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
            return false
        }
    }
    
    // MARK: - 닉네임 중복확인 API
    func checkDuplicateNickname(nickname: String) async -> Bool {
        let result = await authService.checkDuplicateNickname(nickname: nickname)
        
        switch result {
        case .success(let data, _):
            print(data.message)
            return true
        case .failure(let statusCode, let message):
            print("[checkDuplicateNickname] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
            return false
        }
    }
    
    // MARK: - 이메일 중복확인 API
    func checkDuplicateEmail(email: String) async -> Bool {
        let result = await authService.checkDuplicateEmail(email: email)
        
        switch result {
        case .success(let data, _):
            print(data.message)
            return true
        case .failure(let statusCode, let message):
            print("[checkDuplicateEmail] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
            return false
        }
    }
}
