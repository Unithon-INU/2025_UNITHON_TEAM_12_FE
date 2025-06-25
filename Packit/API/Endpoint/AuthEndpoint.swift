//
//  AuthEndpoint.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

enum AuthEndpoint: Endpoint {
    case signUp(body: JoinReqDto)
    case signIn(email: String, password: String)
    case logout(Void)
    case checkDuplicateNickname(nickname: String)
    case checkDuplicateEmail(email: String)
    
    var baseURL: URL { URLManager.shared.baseURL }
    
    var path: String {
        switch self {
        case .signUp: "auth/signup"
        case .signIn: "auth/login"
        case .checkDuplicateNickname: "api/users/check/nickname"
        case .checkDuplicateEmail: "api/users/check/email"
        case .logout: "auth/logout"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .signIn,
            .signUp,
            .logout:
                .post

        case .checkDuplicateNickname,
                .checkDuplicateEmail:
                .get
        }
    }
    
    var headers: [String : String]? { ["Content-Type": "application/json"] }

    var body: Data? {
        switch self {
        case .signIn(let email, let password):
            let body = ["email": email, "password": password]
            return try? JSONEncoder().encode(body)
            
        case .signUp(let body):
            return try? JSONEncoder().encode(body)
            
        default:
            return nil
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .checkDuplicateNickname(let nickname):
            var items: [URLQueryItem] = []
            items.append(URLQueryItem(name: "nickname", value: nickname))
            return items
        case .checkDuplicateEmail(let email):
            var items: [URLQueryItem] = []
            items.append(URLQueryItem(name: "email", value: email))
            return items
        default:
            return nil
        }
    }
}
