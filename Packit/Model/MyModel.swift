//
//  MyModel.swift
//  Packit
//
//  Created by 이예나 on 6/25/25.
//

import Foundation

struct MyInfoModel: Codable {
    let email: String
    let nickname: String
}

struct MyTripModel: Codable {
    let totalCount: Int
    let plannedCount: Int
}
