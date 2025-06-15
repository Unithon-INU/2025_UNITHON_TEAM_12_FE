//
//  AuthEndpoint.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

enum AuthEndpoint: Endpoint {
    case signUp
    case signIn
    
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

    var body: Data? { nil }
    
    var queryItems: [URLQueryItem]? { nil }
}
