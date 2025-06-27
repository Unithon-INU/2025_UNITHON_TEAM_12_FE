//
//  CustomAlertView.swift
//  Packit
//
//  Created by Bowon Han on 6/19/25.
//

import SwiftUI

struct CustomAlertView: View {
    @Binding var isPresented: Bool
    
    @State var title: String
    @State var buttonTitle: String
    
    let onTap: () -> Void
    
    var body: some View {
        if isPresented {
            ZStack {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Text(title)
                        .font(.custom("Pretendard-Bold", size: 20))
                    
                    VStack(spacing: 10) {
                        Button(action: {
                            onTap()
                        }) {
                            Text(buttonTitle)
                                .font(.custom("Pretendard-Bold", size: 15))
                                .frame(maxWidth: .infinity, minHeight: 40)
                                .background(Color.packitPurple)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding(.horizontal, 16)
                        }
                        
                        Button(action: {
                            isPresented = false
                        }) {
                            Text("취소")
                                .font(.custom("Pretendard-Medium", size: 15))
                                .frame(maxWidth: .infinity, minHeight: 40)
                                .background(Color.packitLightPurple)
                                .foregroundColor(Color.packitPurple)
                                .cornerRadius(8)
                                .padding(.horizontal, 16)
                        }
                    }
                    .padding(.horizontal, 10)
                }
                .frame(width: 320, height: 210)
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 10)
            }
        }
    }
}
