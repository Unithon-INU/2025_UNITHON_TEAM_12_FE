//
//  PackitTextField.swift
//  Packit
//
//  Created by Bowon Han on 5/26/25.
//

import SwiftUI

struct PackitTextField: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .font(.custom("Pretendard", size: 16))
                    .fontWeight(.medium)
                    .foregroundStyle(Color.packitLightGray)
                    .padding(.leading, 10)
            }
            
            TextField("", text: $text)
                .padding(.leading, 10)
            
        }
        .padding(.vertical, 13)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.packitPurple, lineWidth: 1)
        }
    }
}

#Preview {
    PackitTextField(text: .constant(""), placeholder: "제목을 입력해주세요.")
}
