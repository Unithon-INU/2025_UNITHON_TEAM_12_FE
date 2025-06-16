//
//  BoxComponent.swift
//  Packit
//
//  Created by 이예나 on 5/25/25.
//

import SwiftUI

struct SelectBoxComponent: View {
    let title: String
    let description: String?
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            
            
            VStack(alignment: .leading, spacing: 10){
                HStack(spacing: 8) {
                    Circle()
                        .fill(isSelected ? Color.packitPurple : Color.clear)
                        .stroke(isSelected ? Color.clear : Color.packitLightGray)
                        .frame(width: 18, height: 18)
                    Text(title)
                        .font(.custom("Pretendard-SemiBold", size: 16))
                        .foregroundColor(.black)
                }
                
                if let description = description {
                    Text(description)
                        .font(.custom("Pretendard-Light", size: 14))
                        .foregroundColor(.black)
                }
            }
            
            Spacer()
            
            if isSelected {
                Image("package")
                    .frame(width: 29)

            } else {
                Image("packagePlus")
                    .frame(width: 30)
            }
        }
            .padding(.horizontal, 16)
            .padding(.vertical, 15)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(isSelected ? Color.packitLightPurple : Color.white)
                    .stroke(Color.packitPurple)
            )
            .padding(.vertical, 6)
            .padding(.horizontal, 26)
        }

    }
