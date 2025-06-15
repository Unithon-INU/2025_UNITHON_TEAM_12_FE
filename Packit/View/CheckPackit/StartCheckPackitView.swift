//
//  StartCheckPackitView.swift
//  Packit
//
//  Created by Bowon Han on 6/15/25.
//

import SwiftUI

struct StartCheckPackitView: View {
    let title: String
    @EnvironmentObject var coordinator: NavigationCoordinator

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    coordinator.popToRoot()
                }, label: {
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 25)
                        .foregroundStyle(Color.packitPurple)
                        .padding(.leading, 30)
                })
                
                Spacer()
            }.padding(.bottom, 60)
            
            Text(title)
                .font(.custom("Pretendard-Bold", size: 36))
                .foregroundStyle(Color.packitPurple)
                .padding(.bottom, 10)
            
            Text("짐 챙기기를 시작해볼까요?")
                .font(.custom("Pretendard-SemiBold", size: 26))
            
            Image("LuggagePerson")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .padding(.vertical, 80)
            
            Spacer()
            
            Button(action: {
                coordinator.push(.checkList(.checkList(title: title)))
            }, label: {
                PackitButton(title: "짐 챙기기 START!")
                    .padding(.horizontal, 23)
                    .padding(.bottom, 10)
            })
        }.toolbarVisibility(.hidden, for: .navigationBar)
    }
}

#Preview {
    StartCheckPackitView(title: "민지와의 제주 여행")
}
