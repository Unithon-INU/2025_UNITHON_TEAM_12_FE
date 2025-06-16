//
//  TripItemReqDto.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

struct AddTripItemReqDto: Codable {
    let name: String
    let quantity: Int
    let memo: String?
}
