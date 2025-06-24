//
//  MyView.swift
//  Packit
//
//  Created by 이예나 on 6/25/25.
//

import SwiftUI

struct MyView: View {
    let title: String
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    var body: some View {
        VStack {
            //네비게이션바
            HStack {
                Button(action: {
                    coordinator.pop()
                }, label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 23)
                        .foregroundStyle(.black)
                })
                
                Text(title)
                    .font(.custom("Pretendard-Bold", size: 15))
                    .padding(.horizontal)
                
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 30)
            
            // 개인정보
            VStack(spacing: 5) {
                Image("myProfile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                Text("nickname")
                    .font(.custom("Pretendard-SemiBold", size: 22))
                    .foregroundColor(.black)
                Text("email")
                    .font(.custom("Pretendard-Light", size: 12))
                    .foregroundColor(.packitDarkGray)
            }
            .padding(.top, 30)
            
            ZStack {
                Rectangle()
                    .fill(Color.packitLightPurple)
                    .frame(height: 98)
                    .padding(.horizontal, 27)
                    .cornerRadius(17)
                
                HStack(spacing: 25) {
                    VStack(spacing: 9) {
                        Text("N")
                            .font(.custom("Pretendard-SemiBold", size: 22))
                            .foregroundColor(.black)
                        Text("총 여행 횟수")
                            .font(.custom("Pretendard-Light", size: 12))
                            .foregroundColor(Color.packitDarkGray)
                    }
                    Divider()
                        .frame(width: 1, height: 70)
                        .foregroundStyle(Color.packitPurple)
                    
                    VStack(spacing: 9) {
                        Text("N")
                            .font(.custom("Pretendard-SemiBold", size: 22))
                            .foregroundColor(.black)
                        Text("총 여행 횟수")
                            .font(.custom("Pretendard-Light", size: 12))
                            .foregroundColor(Color.packitDarkGray)
                    }
                    
                    Divider()
                        .frame(width: 1, height: 70)
                        .foregroundStyle(Color.packitPurple)
                    
                    VStack(spacing: 9) {
                        Text("N")
                            .font(.custom("Pretendard-SemiBold", size: 22))
                            .foregroundColor(.black)
                        Text("총 여행 횟수")
                            .font(.custom("Pretendard-Light", size: 12))
                            .foregroundColor(Color.packitDarkGray)
                    }
                    
                    
                }
            }
            .padding(.top, 35)
            
            Button(action: {
                coordinator.popToRoot()
            }) {
                HStack {
                    Image("packagePlus")
                        .resizable()
                        .frame(width: 25, height: 27)
                    
                    Text("여행 계획하러 가기")
                        .font(.custom("Pretendard-Light", size: 16))
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
            }
            .padding(.horizontal, 27)

            
            Button(action: {
                coordinator.pop()
            }){
                HStack {
                    Image("package")
                        .resizable()
                        .frame(width: 20, height: 27)
                    
                    Text(" 여행 짐 싸러 가기")
                        .font(.custom("Pretendard-Light", size: 16))
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
            }
            .padding(.horizontal, 27)
            
            Spacer()
            
            Button(action: {
                coordinator.pop()
            }){
                HStack {
                    Text("로그아웃")
                        .font(.custom("Pretendard-Light", size: 16))
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
            }
            .padding(.horizontal, 27)
            
        }
        .background(Color(hex: "#F4F3F8"))
        

            

    }
    
       
}

#Preview {
    MyView(title: "마이페이지")
}
