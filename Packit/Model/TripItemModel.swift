//
//  TripItemModel.swift
//  Packit
//
//  Created by Bowon Han on 6/17/25.
//

import Foundation

struct TripItemModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let quantity: Int
    let memo: String?
}
