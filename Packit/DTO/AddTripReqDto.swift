//
//  AddTripResDto.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

struct AddTripReqDto: Codable {
    var title: String
    var region: String
    var tripType: String
    var startDate: String
    var endDate: String
    var description: String
}
