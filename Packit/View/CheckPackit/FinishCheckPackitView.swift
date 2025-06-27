//
//  FinishCheckPackitView.swift
//  Packit
//
//  Created by Bowon Han on 6/27/25.
//

import SwiftUI

struct FinishCheckPackitView: View {
    let title: String
    let tripId: Int
    @EnvironmentObject var coordinator: NavigationCoordinator

    var body: some View {
        VStack {
            Text(title)
                .font(.custom("Pretendard-Bold", size: 36))
                .foregroundStyle(Color.packitPurple)
                .padding(.top, 60)
                .padding(.bottom, 10)
            
            Text("짐 챙기기를 완료했어요!\n이제 여행을 떠나볼까요?")
                .font(.custom("Pretendard-SemiBold", size: 26))
                .lineSpacing(10)
            
            Image("LuggagePerson")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .padding(.vertical, 80)
            
            Spacer()
            
            Button(action: {
                coordinator.popToRoot()
            }, label: {
                PackitButton(title: "끝내기")
                    .padding(.horizontal, 23)
                    .padding(.bottom, 10)
            })
        }.toolbarVisibility(.hidden, for: .navigationBar)
    }
}
