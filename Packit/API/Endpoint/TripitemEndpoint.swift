//
//  TripitemEndpoint.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

enum TripItemEndpoint: Endpoint {
    case addTripItem(tripCategoryId: Int, body: AddTripItemReqDto)
    case fetchTripItemWithCategory(TripCategoryId: Int)
    case toggleItemStatus(tripItemId: Int)
    case addTripItems(tripId: Int, tripCategoryId: Int, body: AddTripItemsReqDto)
    case fetchTemplateItems(categoryId: Int)
    
    var baseURL: URL { URLManager.shared.baseURL }

    var path: String {
        switch self {
        case .addTripItem(let tripCategoryId, _):
            "api/trip-categories/\(tripCategoryId)/trip-items"
        case .fetchTripItemWithCategory(let TripCategoryId):
            "api/trip-categories/\(TripCategoryId)/trip-items"
        case .toggleItemStatus(let tripItemId):
            "api/trip-items/\(tripItemId)/check"
        case .addTripItems(let tripId, let tripCategoryId, _):
            "api/trips/\(tripId)/categories/\(tripCategoryId)/items"
        case .fetchTemplateItems(let categoryId):
            "api/categories/\(categoryId)/template-items"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .addTripItem, .addTripItems:
                .post
        case .fetchTripItemWithCategory, .fetchTemplateItems:
                .get
        case .toggleItemStatus:
                .patch
        }
    }
    
    var headers: [String : String]? { ["Content-Type": "application/json"] }

    var body: Data? {
        switch self {
        case .addTripItem(_, let body):
            return try? JSONEncoder().encode(body)
            
        case .addTripItems(_, _, let body):
            return try? JSONEncoder().encode(body)

        default:
            return nil
        }
    }
    
    var queryItems: [URLQueryItem]? { return nil }
}
