//
//  PlanPackitTitle.swift
//  Packit
//
//  Created by Bowon Han on 5/26/25.
//

import SwiftUI

struct PlanPackitTitle: View {
    @State private var title: String = ""
    
    var body: some View {
        VStack {
            Text("이번 짐의 제목을 정해주세요!")
                .font(.custom("Pretendard", size: 24))
                .fontWeight(.bold)
                .foregroundStyle(Color.packitPurple)
                .padding(.top, 15)
            
            PackitTextField(text: $title, placeholder: Text("제목을 입력해주세요!"))
                .padding([.leading, .trailing], 35)
                .padding(.top, 30)
            
            Spacer()
            
            PackitButton(title: "다음")
                .padding()
        }
    }
}

#Preview {
    PlanPackitTitle()
}
