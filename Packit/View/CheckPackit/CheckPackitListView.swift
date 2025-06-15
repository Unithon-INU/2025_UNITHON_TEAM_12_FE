//
//  CheckPackitListView.swift
//  Packit
//
//  Created by Bowon Han on 6/15/25.
//

import SwiftUI

struct CheckPackitListView: View {
    let title: String
    let categories = ["의류", "잡동사니", "샤워용품", "추가"]
    
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    @State private var selectedCategory: Int = 0

    var body: some View {
        VStack {
//            CategorySelectionView()
//                .padding(.bottom)
            HStack(spacing: 12) {
                ForEach(Array(categories.enumerated()), id: \.offset) {
                    index, category in CategoryButtonComponent(title: category, isSelected: categories[selectedCategory] == category, onTap: {selectedCategory = index})
                }
            }
            
            MultiSelectBoxView()
            
            Button(action: {
                if selectedCategory>=0 && selectedCategory<categories.count-1 {
                    selectedCategory += 1
                }
                else {
                    /// - NOTE: 마지막 카테고리 일시에 
                    coordinator.popToRoot()
                }
            }, label: {
                PackitButton(title: "다음")
                    .padding(.horizontal, 23)
                    .padding(.bottom, 10)
            })
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(title)
    }
}

#Preview {
    CheckPackitListView(title: "민지와의 제주 여행")
}
