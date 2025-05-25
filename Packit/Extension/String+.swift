//
//  String+.swift
//  Packit
//
//  Created by Bowon Han on 5/24/25.
//

import Foundation

extension String {
    func toDateString() -> String? {
///        문자열 파싱
///        Before-----------------
///        2025-07-08T16:37:40.637357
///        After--------------------
///        2025.07.08
        let arr = self.split(separator: "T")
        if arr.isEmpty { return nil }
        return arr[0].replacingOccurrences(of: "-", with: ".")
    }
}
