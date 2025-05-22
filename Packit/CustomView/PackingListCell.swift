//
//  PackingListCell.swift
//  Packit
//
//  Created by Bowon Han on 5/22/25.
//

import SwiftUI

struct PackingListCell: View {
    var body: some View {
        VStack(alignment: .trailing) {
            VStack(alignment: .leading) {
                Text("D-1")
                    .font(.system(size: 14))
                    .fontWeight(.light)
                    .padding(.top, 9)
                    .foregroundStyle(.black)
                
                Text("민지와의 제주 여행")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
            }
            .padding([.leading, .trailing], 6)
            .padding(.bottom, 30)
            
            
            HStack(alignment: .bottom) {
                Image(systemName: "bag.fill")
                    .resizable()
                    .frame(width: 24, height: 31)
                    .foregroundStyle(.white)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("제주도")
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .foregroundStyle(.black)
                    
                    Text("1박 2일")
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .foregroundStyle(.black)

                }
            }
            .padding(.top, 30)
            .padding([.leading, .trailing], 7)
            .padding(.bottom, 11)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.packitLightPurple)
        )
    }
}

#Preview {
    PackingListCell()
}
