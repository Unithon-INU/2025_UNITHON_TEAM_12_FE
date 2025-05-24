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
                .fontWeight(.bold)
                .font(.custom("Pretendard", size: 18))
                .padding(.vertical, 5)
                .padding(.horizontal, 17)
                .foregroundColor(isSelected ? .white: .gray)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(isSelected ? Color.packitPurple : Color.white)
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.packitStroke)
                }
        }
        .animation(.easeInOut, value: isSelected)
    }
}

struct CategorySelectionView: View {
    let categories = ["의류", "잡동사니", "샤워용품", "추가"]
    
    @State private var selectedCategory: String = "샤워용품"
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(categories, id: \.self) {
                category in CategoryButtonComponent(title: category, isSelected: selectedCategory == category, onTap: {selectedCategory = category})
            }
        }
    }
}

struct SelectableCategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelectionView()
    }
}
