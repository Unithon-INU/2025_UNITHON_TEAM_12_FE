//
//  TripEndpoint.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

enum TripEndpoint: Endpoint {
    case fetchMyTrips
    case addTrip(body: AddTripReqDto)
    
    var baseURL: URL { URLManager.shared.baseURL }

    var path: String {
        switch self {
        case .fetchMyTrips:
            "api/trips"
        case .addTrip:
            "api/trips"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchMyTrips:
                .get
        case .addTrip:
                .post
        }
    }
    
    var headers: [String : String]? { ["Content-Type": "application/json"] }

    var body: Data? {
        switch self {
        case .addTrip(let body):
            return try? JSONEncoder().encode(body)
        default:
            return nil
        }
    }
    
    var queryItems: [URLQueryItem]? { return nil }
}
