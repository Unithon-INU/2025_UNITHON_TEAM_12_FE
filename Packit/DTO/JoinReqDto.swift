//
//  JoinReqDto.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

struct JoinReqDto: Codable {
    let email: String
    let password: String
    let nickname: String
    let name: String
    let age: Int
    let gender: String
}
