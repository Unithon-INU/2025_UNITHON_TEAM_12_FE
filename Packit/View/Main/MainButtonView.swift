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

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .font(.custom("Pretendard-Bold", size: 15))
                    .foregroundStyle(Color.black)
                
                if let highlight = highlight {
                    Text(description)
                        .font(.custom("Pretendard-Light", size: 12))
                        .padding(.bottom, -8)
                        .foregroundStyle(Color.black)

                    Text("\(highlight)")
                        .font(.custom("Pretendard-Bold", size: 13))
                        .foregroundStyle(Color.packitPurple)
                        .padding(.bottom, -8)
                    
                    Text("계획이 있어요!")
                        .font(.custom("Pretendard-Light", size: 12))
                        .foregroundStyle(Color.black)
                }
                
                else {
                    Text(description)
                        .font(.custom("Pretendard-Light", size: 12))
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
            
            Image(iconName)
                .resizable()
                .scaledToFill()
                .frame(width: 23, height: 30)
                .foregroundStyle(Color.packitPurple)
                .offset(CGSize(width: -12, height: -12))
        }
    }
}
