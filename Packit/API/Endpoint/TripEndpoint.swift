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
    case fetchTripProgress(tripId: Int)
    case fetchUpcomingTrip
    
    var baseURL: URL { URLManager.shared.baseURL }

    var path: String {
        switch self {
        case .fetchMyTrips:
            "api/trips"
        case .addTrip:
            "api/trips"
        case .fetchTripProgress(let tripId):
            "api/trips/\(tripId)/progress-count"
        case .fetchUpcomingTrip:
            "api/trips/trips/nearest-completed"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchMyTrips,
            .fetchTripProgress,
            .fetchUpcomingTrip:
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
