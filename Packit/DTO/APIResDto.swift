//
//  CommonResDto.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

struct APIResDto<T: Codable>: Codable {
    let success: Bool
    let code: Int
    let message: String
    let data: T
}
