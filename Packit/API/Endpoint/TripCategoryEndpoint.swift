//
//  TripCategoryEndpoint.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

enum TripCategoryEndpoint: Endpoint {
    case fetchTripCategories(tripId: Int)
    
    var baseURL: URL { URLManager.shared.baseURL }

    var path: String {
        switch self {
        case .fetchTripCategories(let tripId):
            "api/trips/\(tripId)/trip-categories"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchTripCategories:
                .get
        }
    }
    
    var headers: [String : String]? { ["Content-Type": "application/json"] }

    var body: Data? {
        return nil
    }
    
    var queryItems: [URLQueryItem]? { return nil }
}
