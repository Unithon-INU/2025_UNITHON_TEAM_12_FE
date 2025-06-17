//
//  TripType.swift
//  Packit
//
//  Created by Bowon Han on 6/17/25.
//

import Foundation

enum TripType: String, CaseIterable {
    case family, friend, business, other
    
    static let orderedCases: [TripType] = [
        .family, .friend, .business, .other
    ]
    
    init?(index: String) {
        switch index {
        case "가족여행": self = .family
        case "친구와의 여행": self = .friend
        case "비지니스": self = .business
        case "기타": self = .other
        default: return nil
        }
    }
    
    func toString() -> String {
        switch self {
        case .family: return "FAMILY"
        case .friend: return "FRIEND"
        case .business: return "BUSINESS"
        case .other: return "OTHER"
        }
    }
    
    func toUIName() -> String {
        switch self {
        case .family: return "가족여행"
        case .friend: return "친구와의 여행"
        case .business: return "비지니스"
        case .other: return "기타"
        }
    }
}
