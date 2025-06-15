//
//  NetworkResult.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

enum NetworkResult<T> {
    case success(data: T, statusCode: Int)
    case failure(statusCode: Int, message: String?)
}
