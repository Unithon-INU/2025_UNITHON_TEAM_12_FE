//
//  TripitemEndpoint.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

enum TripItemEndpoint: Endpoint {
    case addTripItem(tripCategoryId: Int, body: AddTripItemReqDto)
    
    var baseURL: URL { URLManager.shared.baseURL }

    var path: String {
        switch self {
        case .addTripItem(let tripCategoryId, _):
            "api/trip-categories/\(tripCategoryId)/trip-items"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .addTripItem:
                .post
        }
    }
    
    var headers: [String : String]? { ["Content-Type": "application/json"] }

    var body: Data? {
        switch self {
        case .addTripItem(_, let body):
            return try? JSONEncoder().encode(body)
        }
    }
    
    var queryItems: [URLQueryItem]? { return nil }
}
