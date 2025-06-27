//
//  PackitToggleButton.swift
//  Packit
//
//  Created by Bowon Han on 5/26/25.
//

import SwiftUI

struct PackitToggleButton: View {
    let content: String
    var isSelected: Bool
    var onTap: () -> Void

    var body: some View {
        Button(action: {
            onTap()
        }, label: {
            Text(content)
                .font(.custom("Pretendard", size: 14))
                .fontWeight(.bold)
                .foregroundStyle(isSelected ? .white : Color.packitDarkGray)
                .padding(.vertical, 9)
                .padding(.horizontal, 6)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(isSelected ? Color.packitPurple : Color.clear)
                        .stroke(isSelected ? Color.clear : Color.packitDarkGray)
                }
        })
    }
}
