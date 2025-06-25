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

    @EnvironmentObject var viewModel: LoginViewModel

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
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("비밀번호를 입력해주세요!")
                            .font(.custom("Pretendard", size: 16))
                            .fontWeight(.medium)
                            .foregroundStyle(Color.packitLightGray)
                            .padding(.leading, 10)
                    }
                    
                    SecureField("", text: $password)
                        .padding(.leading, 10)
                    
                }
                .padding(.vertical, 13)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.packitPurple, lineWidth: 1)
                }
                
            }.padding()
            
            VStack{
                Button(action: {
                    Task {
                        let result = await viewModel.signin(email: email, password: password)
                        if result {
                            print("결과로 들어옴")
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
