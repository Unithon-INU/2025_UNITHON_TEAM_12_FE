//
//  TripResDto.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

struct TripResDto: Identifiable, Codable {
    let id: Int
    let title: String
    let region: String
    let tripType: String
    let startDate: String // 또는 Date로 변환 가능
    let endDate: String   // 또는 Date로 변환 가능
    let description: String
    let isCompleted: Bool
}
