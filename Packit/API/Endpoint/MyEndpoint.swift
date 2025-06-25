//
//  MyEndpoint.swift
//  Packit
//
//  Created by 이예나 on 6/25/25.
//

import Foundation

enum MyEndpoint: Endpoint {
    case fetchMyInfo
    case fetchMyTrip
    
    var baseURL: URL { URLManager.shared.baseURL }

    var path: String {
        switch self {
        case .fetchMyInfo:
            "api/user/mypage"
        case .fetchMyTrip:
            "/user/mypage/trip-summary"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchMyInfo, .fetchMyTrip:
                .get
        }
    }
    
    var headers: [String : String]? { ["Content-Type": "application/json"] }

    var body: Data? {
        return nil
    }
    
    var queryItems: [URLQueryItem]? { return nil }
}
