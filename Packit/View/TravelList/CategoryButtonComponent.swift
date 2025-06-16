//
//  CategoryButtonComponent.swift
//  Packit
//
//  Created by 이예나 on 5/24/25.
//

import SwiftUI

struct CategoryButtonComponent: View {
    var title: String
    var isSelected: Bool
    var onTap: () -> Void
    
    var body: some View {
        Button(action: {
            onTap()
        }) {
            Text(title)
                .font(.custom("Pretendard-Bold", size: 15))
                .lineLimit(1)
                .padding(.vertical, 7)
                .padding(.horizontal, 20)
                .foregroundColor(isSelected ? .white: .gray)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(isSelected ? Color.packitPurple : Color.white)
                        .stroke(isSelected ? .clear : Color.packitLightGray)
                )
        }
        .animation(.easeInOut, value: isSelected)
    }
}
