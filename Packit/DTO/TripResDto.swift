//
//  TripResDto.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

struct TripResDto: Identifiable, Codable {
    let id: Int
    let title: String
    let region: String
    let tripType: String
    let startDate: String
    let endDate: String  
    let description: String
    let isCompleted: Bool
}
