//
//  PackitButton.swift
//  Packit
//
//  Created by Bowon Han on 5/26/25.
//

import SwiftUI

struct PackitButton: View {
    let title: String
    
    var body: some View {
//        Button(action: {}, label: {
            Text(title)
                .font(.custom("Pretendard", size: 20))
                .fontWeight(.bold)
                .foregroundStyle(.white)
//        })
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.packitPurple)
        }
    }
}
