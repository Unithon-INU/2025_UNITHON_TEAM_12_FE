//
//  AuthService.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

protocol AuthServiceProtocol {
    // MARK: - 로그인 API
    func signin(email: String, password: String) async -> NetworkResult<APIResDto<CommonResDto>>

    // MARK: - 회원가입 API
    func signup() async -> NetworkResult<APIResDto<CommonResDto>>
}

final class AuthService: AuthServiceProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol=NetworkService()) {
        self.networkService = networkService
    }
    
    // MARK: - 로그인 API
    func signin(email: String, password: String) async -> NetworkResult<APIResDto<CommonResDto>> {
        return await networkService.request(AuthEndpoint.signIn(email: email, password: password))
    }

    // MARK: - 회원가입 API
    func signup() async -> NetworkResult<APIResDto<CommonResDto>> {
        return await networkService.request(AuthEndpoint.signUp)
    }
}
