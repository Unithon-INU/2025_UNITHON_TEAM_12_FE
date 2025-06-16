//
//  JoinView.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import SwiftUI

struct JoinView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordCheck: String = ""
    @State private var nickname: String = ""
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var gender: String = ""
    
    var body: some View {
        VStack {
            HStack{
                Text("회원가입")
                    .font(.custom("Pretendard-Bold", size: 30))
                    .foregroundStyle(Color.packitPurple)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("이메일")
                        .font(.custom("Pretendard-Bold", size: 15))
                        .foregroundStyle(Color.packitPurple)
                    PackitTextField(text: $email, placeholder: "이메일을 입력해주세요!")
                }
                .padding(.horizontal)
                .padding(.bottom, 15)
                
                VStack(alignment: .leading) {
                    Text("비밀번호")
                        .font(.custom("Pretendard-Bold", size: 15))
                        .foregroundStyle(Color.packitPurple)
                    PackitTextField(text: $password, placeholder: "비밀번호를 입력해주세요!")
                    PackitTextField(text: $passwordCheck, placeholder: "비밀번호를 한번 더 입력해주세요!")
                }
                .padding(.horizontal)
                .padding(.bottom, 15)
                
                VStack(alignment: .leading) {
                    Text("닉네임")
                        .font(.custom("Pretendard-Bold", size: 15))
                        .foregroundStyle(Color.packitPurple)
                    PackitTextField(text: $nickname, placeholder: "닉네임을 입력해주세요!")
                }
                .padding(.horizontal)
                .padding(.bottom, 15)
                
                VStack(alignment: .leading) {
                    Text("이름")
                        .font(.custom("Pretendard-Bold", size: 15))
                        .foregroundStyle(Color.packitPurple)
                    PackitTextField(text: $name, placeholder: "이름을 입력해주세요!")
                }
                .padding(.horizontal)
                .padding(.bottom, 15)
                
                VStack(alignment: .leading) {
                    Text("나이")
                        .font(.custom("Pretendard-Bold", size: 15))
                        .foregroundStyle(Color.packitPurple)
                    PackitTextField(text: $age, placeholder: "나이를 입력해주세요!")
                }
                .padding(.horizontal)
                .padding(.bottom, 15)
                
                VStack(alignment: .leading) {
                    Text("성별")
                        .font(.custom("Pretendard-Bold", size: 15))
                        .foregroundStyle(Color.packitPurple)
                    PackitTextField(text: $gender, placeholder: "성별을 입력해주세요!")
                }
                .padding(.horizontal)
                .padding(.bottom, 15)
            }
            
            Button(action: {
                
            }, label: {
                PackitButton(title: "완료")
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
            })
        }
    }
}

#Preview {
    JoinView()
}
