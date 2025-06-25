//
//  MyModel.swift
//  Packit
//
//  Created by 이예나 on 6/25/25.
//

import Foundation

struct MyInfoModel: Codable {
    var email: String = ""
    var nickname: String = ""
}

struct MyTripModel: Codable {
    var totalCount: Int = 0
    var plannedCount: Int = 0
    var completedCount: Int = 0
}
