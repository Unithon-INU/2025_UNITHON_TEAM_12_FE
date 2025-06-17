//
//  AuthService.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

protocol AuthServiceProtocol {
    // MARK: - 로그인 API
    func signin(email: String, password: String) async -> NetworkResult<APIResDto<String?>>

    // MARK: - 회원가입 API
    func signup(body: JoinReqDto) async -> NetworkResult<APIResDto<String?>>
    
    // MARK: - 닉네임 중복 체크 API
    func checkDuplicateNickname(nickname: String) async -> NetworkResult<APIResDto<String>>
    
    // MARK: - 이메일 중복 체크 API
    func checkDuplicateEmail(email: String) async -> NetworkResult<APIResDto<String>>
}

final class AuthService: AuthServiceProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol=NetworkService()) {
        self.networkService = networkService
    }
    
    // MARK: - 로그인 API
    func signin(email: String, password: String) async -> NetworkResult<APIResDto<String?>> {
        return await networkService.request(AuthEndpoint.signIn(email: email, password: password))
    }

    // MARK: - 회원가입 API
    func signup(body: JoinReqDto) async -> NetworkResult<APIResDto<String?>> {
        return await networkService.request(AuthEndpoint.signUp(body: body))
    }
    
    // MARK: - 닉네임 중복 체크 API
    func checkDuplicateNickname(nickname: String) async -> NetworkResult<APIResDto<String>> {
        return await networkService.request(AuthEndpoint.checkDuplicateNickname(nickname: nickname))
    }
    
    // MARK: - 이메일 중복 체크 API
    func checkDuplicateEmail(email: String) async -> NetworkResult<APIResDto<String>> {
        return await networkService.request(AuthEndpoint.checkDuplicateEmail(email: email))
    }
}
