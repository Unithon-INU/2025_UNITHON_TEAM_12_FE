//
//  Color.swift
//  Packit
//
//  Created by Bowon Han on 5/20/25.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
      let scanner = Scanner(string: hex)
      _ = scanner.scanString("#")
      
      var rgb: UInt64 = 0
      scanner.scanHexInt64(&rgb)
      
      let r = Double((rgb >> 16) & 0xFF) / 255.0
      let g = Double((rgb >>  8) & 0xFF) / 255.0
      let b = Double((rgb >>  0) & 0xFF) / 255.0
      self.init(red: r, green: g, blue: b)
    }
}

extension Color {
    static let packitPurple = Color(hex: "#7C6AF8")
    static let packitLightPurple = Color(hex: "#E8E5FF")
    static let packitStroke = Color(hex: "#D9D9D9")
    static let packitText = Color(hex: "#ADADAD")
    static let packitLightText = Color(hex: "#4C4C4C")
}
