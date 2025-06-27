//
//  TripProgressResDto.swift
//  Packit
//
//  Created by Bowon Han on 6/27/25.
//

import Foundation

struct TripProgressResDto: Codable {
    let totalCategoryCount: Int
    let completedCategoryCount: Int
    let progressRate: Float
}
