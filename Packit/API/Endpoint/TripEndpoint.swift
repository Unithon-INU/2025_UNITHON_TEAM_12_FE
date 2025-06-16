//
//  TripEndpoint.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

enum TripEndpoint: Endpoint {
    case fetchMyTrips
    
    var baseURL: URL { URLManager.shared.baseURL }

    var path: String {
        switch self {
        case .fetchMyTrips:
            "api/trips"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchMyTrips:
                .get
        }
    }
    
    var headers: [String : String]? { ["Content-Type": "application/json"] }

    var body: Data? { return nil }
    
    var queryItems: [URLQueryItem]? { return nil }
}
