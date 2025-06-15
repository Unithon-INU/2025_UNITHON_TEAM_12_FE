//
//  CheckPackitListView.swift
//  Packit
//
//  Created by Bowon Han on 6/15/25.
//

import SwiftUI

struct CheckPackitListView: View {
    let title: String
    
    var body: some View {
        NavigationStack {
            CategorySelectionView()
                .padding(.bottom)
            
            MultiSelectBoxView()
            
            PackitButton(title: "다음")
                .padding(.horizontal, 23)
                .padding(.bottom, 10)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(title)
    }
}

#Preview {
    CheckPackitListView(title: "민지와의 제주 여행")
}
