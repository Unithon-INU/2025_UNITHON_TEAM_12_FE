//
//  PlanPackitListView.swift
//  Packit
//
//  Created by Bowon Han on 6/14/25.
//

import SwiftUI

struct PlanPackitListView: View {
    let category = ["샤워용품", "의류", "화장품", "생활용품", "기타"]
    @State private var addListText: String = ""
    
    var body: some View {
        VStack(spacing: 14) {
            // MARK: - 상단 카테고리 탭
            HStack(spacing: 5) {
                ForEach(category, id: \.self) { category in
                    Text(category)
                        .font(.custom("Pretendard-Bold", size: 14))
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.white)
                        }
                }
            }
            .padding(5)
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.packitLightGray)
            }
            
            PackitTextField(text: $addListText, placeholder: "추가할 물품을 입력해주세요!")
                .padding(.horizontal)
            
            LazyVStack {
                ForEach() {
                    
                }
            }
        }
    }
}

#Preview {
    PlanPackitListView()
}
