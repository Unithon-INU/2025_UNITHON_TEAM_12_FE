//
//  PackingListCell.swift
//  Packit
//
//  Created by Bowon Han on 5/22/25.
//

import SwiftUI

struct PackingListCell: View {
    @ObservedObject var viewModel: PackingListCellViewModel
    
    init(viewModel: PackingListCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(viewModel.trip.endDate.toDateString() ?? "")
                    .font(.custom("Pretendard-Light", size: 14))
                    .padding(.top, 9)
                    .foregroundStyle(.black)
                
                Text(viewModel.trip.title)
                    .font(.custom("Pretendard-Bold", size: 16))
                    .foregroundStyle(.black)
            }
            .padding(.top, 5)
            .padding(.horizontal, 15)
            .padding(.bottom, 30)
            
            
            HStack(alignment: .bottom) {
                Image("packageWhite")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 31)
                    .foregroundStyle(.white)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(viewModel.trip.region)
                        .font(.custom("Pretendard-Regular", size: 14))
                        .foregroundStyle(.black)
                    
                    Text("1박 2일")
                        .font(.custom("Pretendard-Regular", size: 14))
                        .foregroundStyle(.black)

                }
            }
            .frame(minWidth: 130)
            .padding(.top, 30)
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.packitLightPurple)
        )
    }
}
