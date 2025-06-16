//
//  LoginView.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var coordinator: NavigationCoordinator

    @ObservedObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Image("package")
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .padding(.top, 100)
                .padding(.bottom, 40)
            
            VStack{
                PackitTextField(text: $email, placeholder: "이메일을 입력해주세요!")
                PackitTextField(text: $password, placeholder: "비밀번호를 입력해주세요!")
            }.padding()
            
            VStack{
                Button(action: {
                    Task {
                        let result = await viewModel.signin(email: email, password: password)
                        if result {
                            print("결과로 들어옴")
//                            viewModel.isLoggedIn = true
                            coordinator.popToRoot()
                        }
                    }
                }, label: {
                    Text("로그인")
                        .font(.custom("Pretendard-Bold", size: 17))
                        .foregroundStyle(.white)
                        .padding(.vertical, 16)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.packitPurple)
                        }
                })
                
                Button(action: {
                    coordinator.push(.auth(.join))
                }, label: {
                    Text("회원가입")
                        .font(.custom("Pretendard-Bold", size: 17))
                        .foregroundStyle(Color.packitPurple)
                        .padding(.vertical, 16)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.packitLightPurple)
                        }
                })
            }.padding()
            
            Spacer()
        }
    }
}
