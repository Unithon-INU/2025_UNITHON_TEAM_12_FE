//
//  PlanPackitTitle.swift
//  Packit
//
//  Created by Bowon Han on 5/26/25.
//

import SwiftUI

struct PlanPackitTitleView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    @State private var title: String = ""
        
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    coordinator.pop()
                }, label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 23)
                        .foregroundStyle(.black)
                })
                
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 30)
            
            Text("이번 짐의 제목을 정해주세요!")
                .font(.custom("Pretendard-Bold", size: 24))
                .foregroundStyle(Color.packitPurple)
                .padding(.top, 15)
            
            PackitTextField(text: $title, placeholder: "제목을 입력해주세요!")
                .padding(.horizontal, 30)
                .padding(.top, 30)
            
            Spacer()
            
            Button(action: {
                coordinator.formViewModel.reqBody.title = title
                coordinator.push(.plan(.tripProperty))
            }, label: {
                Text("다음")
                    .font(.custom("Pretendard-Bold", size: 20))
                    .foregroundStyle(title.isEmpty ? Color.packitPurple : .white)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(title.isEmpty ? Color.packitLightPurple : Color.packitPurple)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 15)
            }).disabled(title.isEmpty)
        }
    }
}
