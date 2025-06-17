//
//  TripItemResDto.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

struct TripItemResDto: Codable, Identifiable {
    let id: Int
    var name: String
    var quantity: Int
    var isChecked: Bool
    var isSaved: Bool
    var isAiGenerated: Bool
    var memo: String?
}
