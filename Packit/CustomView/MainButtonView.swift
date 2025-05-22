//
//  MainButton.swift
//  Packit
//
//  Created by Bowon Han on 5/20/25.
//

import SwiftUI

struct MainButtonView: View {
    let title: String
    let description: String
    let highlight: String?
    let iconName: String
    let iconOffset: CGSize
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                
                if let highlight = highlight {
                    Text(description)
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .padding(.bottom, -8)
                    
                    Text("\(highlight)")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.packitPurple)
                        .padding(.bottom, -8)
                    
                    Text("계획이 있어요!")
                        .font(.system(size: 12))
                        .fontWeight(.light)
                }
                
                else {
                    Text(description)
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .lineSpacing(5)
                }
                   
                Spacer()
            }
            .padding([.leading, .top], 15)
            .padding(.trailing, 41)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.packitPurple,lineWidth: 1)
                    .shadow(radius: 2)
            )
            
            Image(systemName: iconName)
                .resizable()
                .frame(width: 23, height: 30)
                .foregroundStyle(Color.packitPurple)
                .offset(iconOffset)
        }
    }
}

#Preview {
    MainButtonView(title: "남은 짐 챙기기", description: "아직 완성되지 않은", highlight: "민지와 부산 짐싸기", iconName: "bag", iconOffset: CGSize(width: -12, height: -12))
}
