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
    
    var body: some View {
        HStack(spacing: 16) {
            Image("packagePlus")
                .frame(width: 30)

            VStack(alignment: .leading, spacing: 10){

            Text(title)
                .font(.custom("Pretendard-SemiBold", size: 16))
                .foregroundColor(.black)
                
            Text(description)
                .font(.custom("Pretendard-Light", size: 14))
                .foregroundColor(.black)
                .lineLimit(1)


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
