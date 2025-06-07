//
//  View+.swift
//  Packit
//
//  Created by Bowon Han on 5/29/25.
//

import SwiftUI

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil)
    }
}
