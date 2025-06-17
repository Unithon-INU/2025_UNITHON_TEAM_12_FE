//
//  AddTripItemsReqDto.swift
//  Packit
//
//  Created by Bowon Han on 6/17/25.
//

import Foundation

struct AddTripItemsReqDto: Codable {
    let items: [AddTripItemReqDto]
}
