//
//  TripItemModel.swift
//  Packit
//
//  Created by 이예나 on 5/24/25.
//

import Foundation

struct TripItem: Identifiable, Codable {
    let tripItemId: Int
    var itemName: String
    var quantity: Int
    var isChecked: Bool
    var isAIRecommended: Bool
    var notes: String?
    var tripCategoryId: Int
    
    var id: Int { tripItemId }
}
