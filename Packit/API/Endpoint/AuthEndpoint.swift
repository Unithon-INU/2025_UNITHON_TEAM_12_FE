//
//  AuthEndpoint.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

enum AuthEndpoint: Endpoint {
    case signUp
    case signIn(email: String, password: String)
    
    var baseURL: URL { URLManager.shared.baseURL }
    
    var path: String {
        switch self {
        case .signUp: "auth/signup"
        case .signIn: "auth/login"
        }
    }
    
    var method: HTTPMethod {
        .post
    }
    
    var headers: [String : String]? { ["Content-Type": "application/json"] }

    var body: Data? {
        switch self {
        case .signIn(let email, let password):
            let body = ["email": email, "password": password]
            return try? JSONEncoder().encode(body)
            
        default:
            return nil
        }
    }
    
    var queryItems: [URLQueryItem]? { nil }
}
