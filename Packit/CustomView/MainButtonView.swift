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
                    .foregroundStyle(Color.black)
                
                if let highlight = highlight {
                    Text(description)
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .padding(.bottom, -8)
                        .foregroundStyle(Color.black)

                    Text("\(highlight)")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.packitPurple)
                        .padding(.bottom, -8)
                    
                    Text("계획이 있어요!")
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .foregroundStyle(Color.black)
                }
                
                else {
                    Text(description)
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .lineSpacing(5)
                        .foregroundStyle(Color.black)
                        .multilineTextAlignment(.leading)
                }
                   
                Spacer()
            }
            .padding([.leading, .top], 15)
            .padding(.trailing, 42)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .stroke(Color.packitPurple,lineWidth: 1)
                    .shadow(radius: 1.3)
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
