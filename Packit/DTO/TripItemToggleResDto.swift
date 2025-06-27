//
//  ItemToggleResDto.swift
//  Packit
//
//  Created by Bowon Han on 6/27/25.
//

import Foundation

struct TripItemToggleResDto: Codable {
    let tripId: Int
    let totalCount: Int
    let checkedCount: Int
    let progressPercent: Int
}
