//
//  ListCardComponentView.swift
//  Packit
//
//  Created by 이예나 on 6/5/25.
//

import SwiftUI

struct ListCardComponentView: View {
    
    
    var body: some View {
        VStack(spacing: 7) {
            HStack{
                Text(" D-1")
                    .font(.custom("Pretendard", size: 17))
                    .fontWeight(.light)
                    .foregroundColor(Color.packitLightText)
                Spacer()
            }
            
            HStack{
                Text("민지와 제주 여행")
                    .font(.custom("Pretendard", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.packitPurple)
                Spacer()
            }
            
            Spacer()
            
            HStack{
                Spacer()

                Text("제주도")
                    .font(.custom("Pretendard", size: 15))
                    .fontWeight(.ultraLight)
                    .foregroundColor(.black)
            }
            HStack{
                Spacer()

                Text("2박 3일 일정")
                    .font(.custom("Pretendard", size: 15))
                    .fontWeight(.ultraLight)
                    .foregroundColor(.black)
            }
            HStack{
                Spacer()

                Text("2025.05.12")
                    .font(.custom("Pretendard", size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
            }
            
           
            
        }
        .frame(width: 170, height: 183)
        .padding(13)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.packitPurple)
        )
        .overlay(
            Image("packagePlus")
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .padding(10),
            alignment: .bottomLeading
        )

    }
}

#Preview {
    ListCardComponentView()
}

