//
//  BoxComponent.swift
//  Packit
//
//  Created by 이예나 on 5/25/25.
//

import SwiftUI

struct BoxComponent: View {
    let title: String
    let description: String
//    let isSelected: Bool
//    let onTap: () -> Void
    
    var body: some View {
                HStack(spacing: 16) {
//                    if isSelected {
//                        Image("package")
//                            .frame(width: 30)
//                    } else {
                        Image("packagePlus")
                            .frame(width: 30)
//                    }

                    
                    VStack(alignment: .leading, spacing: 10){

                    Text(title)
                        .font(.custom("Pretendard", size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        
                    Text(description)
                        .font(.custom("Pretendard", size: 14))
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .lineLimit(1) // 최대 1줄로 제한


                }
                    Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 15)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill( Color.white)
                    .stroke(Color.packitPurple)
            )
            .padding(.vertical, 6)
            .padding(.horizontal, 25)
        }

    }
