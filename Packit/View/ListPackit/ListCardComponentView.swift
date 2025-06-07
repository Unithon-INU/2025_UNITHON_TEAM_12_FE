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
                    .lineLimit(2)
                Spacer()
            }
            
            Spacer(minLength: 10)
            
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
        .frame(minWidth: 155, maxWidth: 166, minHeight: 183, maxHeight: 183, alignment: .topLeading)
        .padding(13)
        .background(trip.isBeen ? Color.packitLightPurple : Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.packitPurple, lineWidth: 1)
        )
        .overlay(
            Image(trip.isBeen ? "package" : "packagePlus")
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .padding(10),
            alignment: .bottomLeading
        )
        .shadow(
            color: trip.isBeen ? Color.black.opacity(0.1) : Color.clear,
            radius: trip.isBeen ? 10 : 0,
            x: trip.isBeen ? 1 : 0,
            y: trip.isBeen ? 2 : 0
        )
    }
}

//#Preview {
//    ListCardComponentView()
//}
