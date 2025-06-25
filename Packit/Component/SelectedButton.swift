//
//  SelectedButton.swift
//  Packit
//
//  Created by Bowon Han on 6/19/25.
//

import SwiftUI

struct SelectedButton: View {
    let title: String
    @Binding var isSelected: Bool

    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            Text(title)
                .font(.custom("Pretendard-Regular", size: 15))
                .foregroundStyle(isSelected ? .white : Color.packitPurple)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.packitPurple, lineWidth: 2)
                        .fill(isSelected ? Color.packitPurple : .white)
                }
        }
    }
}
