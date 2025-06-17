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
        Text(title)
            .font(.custom("Pretendard-Bold", size: 20))
            .foregroundStyle(.white)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.packitPurple)
            }
    }
}
