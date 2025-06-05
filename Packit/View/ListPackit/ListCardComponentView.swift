//
//  ListCardComponentView.swift
//  Packit
//
//  Created by 이예나 on 6/5/25.
//

import SwiftUI

struct ListCardComponentView: View {
    let trip: Trip
    
    var body: some View {
        VStack(spacing: 7) {
            HStack{
                Text(trip.periodText)
                    .font(.custom("Pretendard", size: 17))
                    .fontWeight(.light)
                    .foregroundColor(Color.packitLightText)
                Spacer()
            }
            
            HStack{
                Text(trip.title)
                    .font(.custom("Pretendard", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(trip.isBeen ? .black : Color.packitPurple)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2) // 제목이 길어질 경우 2줄까지 허용
                Spacer()
            }
            
            Spacer(minLength: 10) // 최소 간격 보장
            
            HStack{
                Spacer()
                Text(trip.location)
                    .font(.custom("Pretendard-ExtraLight", size: 15))
                    .foregroundColor(.black)
                    .lineLimit(1)
            }
            HStack{
                Spacer()
                Text(trip.durationText)
                    .font(.custom("Pretendard-ExtraLight", size: 15))
                    .foregroundColor(.black)
                    .lineLimit(1)
            }
            HStack{
                Spacer()
                Text(trip.start_date)
                    .font(.custom("Pretendard-Medium", size: 18))
                    .foregroundColor(.black)
                    .lineLimit(1)
            }
        }
        .frame(
            minWidth: 150,        // 최소 너비
            maxWidth: 166,        // 최대 너비 (기존 170에서 약간 증가)
            minHeight: 160,       // 최소 높이
            maxHeight: 183,       // 최대 높이 (기존 183에서 약간 증가)
            alignment: .topLeading
        )
        .padding(13)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.packitPurple)
        )
        .overlay(
            Group {
                Image(trip.isBeen ? "package" : "packagePlus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .padding(10)
            },
            alignment: .bottomLeading
        )
    }
}

// 더 유연한 버전 (화면 크기에 따라 완전히 자동 조정)
struct FlexibleListCardComponentView: View {
    let trip: Trip
    
    var body: some View {
        VStack(spacing: 7) {
            HStack{
                Text(trip.periodText)
                    .font(.custom("Pretendard-Light", size: 17))
                    .foregroundColor(Color.packitLightText)
                Spacer()
            }
            
            HStack{
                Text(trip.title)
                    .font(.custom("Pretendard-Bold", size: 20))
                    .foregroundColor(trip.isBeen ? .black : Color.packitPurple)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                Spacer()
            }
            
            Spacer(minLength: 5)
            
            VStack(alignment: .trailing, spacing: 3) {
                Text(trip.location)
                    .font(.custom("Pretendard-ExtraLight", size: 15))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text(trip.durationText)
                    .font(.custom("Pretendard-ExtraLight", size: 15))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text(trip.start_date)
                    .font(.custom("Pretendard-Medium", size: 18))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(13)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.packitPurple)
        )
        .overlay(
            Group {
                Image(trip.isBeen ? "package" : "packagePlus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .padding(10)
            },
            alignment: .bottomLeading
        )
        .aspectRatio(0.9, contentMode: .fit) // 가로:세로 비율 유지
    }
}

//#Preview {
//    ListCardComponentView()
//}
