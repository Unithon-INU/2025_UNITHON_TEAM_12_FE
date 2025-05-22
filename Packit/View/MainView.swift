//
//  MainView.swift
//  Packit
//
//  Created by Bowon Han on 5/20/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            
            // MARK: - MainButtonView HStack
            HStack(spacing: 21) {
                Button(action: {}, label: {
                    MainButtonView(
                        title: "짐싸기 계획하기",
                        description: "어떤 짐을 챙길지 함께 \n정해보아요!",
                        highlight: nil,
                        iconName: "bag.fill",
                        iconOffset: CGSize(width: -12, height: -12)
                    )
                })
               
                Button(action: {}, label: {
                    MainButtonView(
                        title: "남은 짐 챙기기",
                        description: "아직 완성되지 않은",
                        highlight: "민지와 부산 짐싸기",
                        iconName: "bag",
                        iconOffset: CGSize(width: -12, height: -12)
                    )
                })
            }
            .frame(height: 120)
            .padding()
            
            // MARK: - "다가오는 여정" View
            HStack {
                Text("다가오는 여정")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .padding(.leading, 40)
                    .padding(.top)
                
                Spacer()
            }

            ZStack(alignment: .bottom) {
                VStack() {
                    HStack(alignment: .center,spacing: 15) {
                        Image(systemName: "pin.fill")
                            .resizable()
                            .frame(width: 12, height: 20)
                            .foregroundStyle(Color.packitPurple)
                        
                        Text("민지와의 제주 여행")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("D-1")
                            .font(.system(size: 20))
                            .fontWeight(.thin)
                    }
                    .padding([.leading, .trailing], 15)
                    .padding(.top, 14)
                    
                    Spacer()
                }
                .frame(maxHeight: 200)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.packitPurple,lineWidth: 1)
                        .fill(Color.packitLightPurple)
                )
                .padding([.leading, .trailing], 30)
                
                Button(action: {
                    
                }, label: {
                    Text("민지와의 제주 여행 짐챙기기 START!")
                        .foregroundStyle(.white)
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                })
                .padding([.leading, .trailing], 30)
                .padding([.top, .bottom], 12)
                .background(
                    RoundedRectangle(cornerRadius: 13)
                        .fill(Color.packitPurple)
                        .shadow(radius: 3)
                )
                .offset(CGSize(width: 0, height: 20))
            }
        }
    }
}

#Preview {
    MainView()
}
