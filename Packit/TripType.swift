//
//  TripType.swift
//  Packit
//
//  Created by Bowon Han on 6/17/25.
//

import Foundation

enum TripType: String, CaseIterable {
    case OVERSEAS, SUMMER, WINTER, RAINY, MENSTRUAL_PERIOD, WITH_CHILD, HOTEL
    
    static let orderedCases: [TripType] = [
        .OVERSEAS, .SUMMER, .WINTER, .RAINY, .MENSTRUAL_PERIOD, .WITH_CHILD, .HOTEL
    ]
    
    init?(index: String) {
        switch index {
        case "해외": self = .OVERSEAS
        case "여름": self = .SUMMER
        case "겨울": self = .WINTER
        case "비오는날씨": self = .RAINY
        case "생리기간": self = .MENSTRUAL_PERIOD
        case "아이 동반": self = .WITH_CHILD
        case "호텔 숙박": self = .HOTEL
        default: return nil
        }
    }
    
    func toString() -> String {
        switch self {
        case .OVERSEAS: return "OVERSEAS"
        case .SUMMER: return "SUMMER"
        case .WINTER: return "WINTER"
        case .RAINY: return "RAINY"
        case .MENSTRUAL_PERIOD: return "MENSTRUAL_PERIOD"
        case .WITH_CHILD: return "WITH_CHILD"
        case .HOTEL: return "HOTEL"
        }
    }
    
    func toUIName() -> String {
        switch self {
        case .OVERSEAS: return "해외"
        case .SUMMER: return "여름"
        case .WINTER: return "겨울"
        case .RAINY: return "비오는날씨"
        case .MENSTRUAL_PERIOD: return "생리기간"
        case .WITH_CHILD: return "아이 동반"
        case .HOTEL: return "호텔 숙박"
        }
    }
}
