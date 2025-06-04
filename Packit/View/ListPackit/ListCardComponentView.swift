//
//  ListCardComponentView.swift
//  Packit
//
//  Created by 이예나 on 6/5/25.
//

import SwiftUI

struct ListCardComponentView: View {
    @State var isBeen: Bool = false
    
    var body: some View {
        VStack(spacing: 7) {
            HStack{
                Text((isBeen ? "3월" : "D-1"))  //viewmodel.start_date(d-day how 처리?)
                    .font(.custom("Pretendard", size: 17))
                    .fontWeight(.light)
                    .foregroundColor(Color.packitLightText)
                Spacer()
            }
            
            HStack{
                Text("민지와 제주 여행") //viewmodel.title
                    .font(.custom("Pretendard", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(isBeen ? .black : Color.packitPurple)
                Spacer()
            }
            
            Spacer()
            
            HStack{
                Spacer()

                Text("제주도") //viewmodel.location
                    .font(.custom("Pretendard", size: 15))
                    .fontWeight(.ultraLight)
                    .foregroundColor(.black)
            }
            HStack{
                Spacer()

                Text("2박 3일 일정") //viewmodel.enddate~startdate counting?
                    .font(.custom("Pretendard", size: 15))
                    .fontWeight(.ultraLight)
                    .foregroundColor(.black)
            }
            HStack{
                Spacer()

                Text("2025.05.12")
                    .font(.custom("Pretendard", size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
            }
            
           
            
        }
        .frame(width: 170, height: 183)
        .padding(13)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.packitPurple)
        )
        .overlay(
            Group {
                Image(isBeen ? "package" : "packagePlus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .padding(10)
            },
            alignment: .bottomLeading
        )

    }
}

#Preview {
    ListCardComponentView()
}

