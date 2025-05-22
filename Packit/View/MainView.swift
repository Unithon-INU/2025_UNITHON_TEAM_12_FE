//
//  MainView.swift
//  Packit
//
//  Created by Bowon Han on 5/20/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        HStack(spacing: 21) {
            MainButtonView(title: "짐싸기 계획하기", description: "어떤 짐을 챙길지 함께 \n정해보아요!", highlight: nil, iconName: "bag.fill", iconOffset: CGSize(width: -12, height: -12))
            
            MainButtonView(title: "남은 짐 챙기기", description: "아직 완성되지 않은", highlight: "민지와 부산 짐싸기", iconName: "bag", iconOffset: CGSize(width: -12, height: -12))
        }
        .frame(height: 120)
    }
}

#Preview {
    MainView()
}
