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
    
    @State private var selectedGender: String = ""
    
    @State private var showEmailAlert: Bool = false
    @State private var showNicknameAlert: Bool = false
    
    @State private var canUseEmail: Bool = false
    @State private var canUseNickname: Bool = false
    
    @EnvironmentObject var coordinator: NavigationCoordinator
    @ObservedObject var viewModel = JoinViewModel()
    
    var body: some View {
        ZStack {
            VStack {
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
                    
                    Spacer()
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                
                HStack{
                    Text("회원가입")
                        .font(.custom("Pretendard-Bold", size: 30))
                        .foregroundStyle(Color.packitPurple)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                ScrollView {
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            Text("이메일")
                                .font(.custom("Pretendard-Bold", size: 15))
                                .foregroundStyle(Color.packitPurple)
                            PackitTextField(text: $email, placeholder: "이메일을 입력해주세요!")
                        }
                        
                        Button(action: {
                            Task {
                                let result = await viewModel.checkDuplicateEmail(email: email)
                                canUseEmail = result
                                showEmailAlert = true
                            }
                        }, label: {
                            Text("중복확인")
                                .font(.custom("Pretendard-SemiBold", size: 15))
                                .foregroundStyle(Color.packitPurple)
                        })
                        .frame(width: 60, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.packitLightPurple)
                        ).padding(.bottom, 3)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 15)
                    
                    VStack(alignment: .leading) {
                        Text("비밀번호")
                            .font(.custom("Pretendard-Bold", size: 15))
                            .foregroundStyle(Color.packitPurple)
                        
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
                        
                        ZStack(alignment: .leading) {
                            if passwordCheck.isEmpty {
                                Text("비밀번호를 한번 더 입력해주세요!")
                                    .font(.custom("Pretendard", size: 16))
                                    .fontWeight(.medium)
                                    .foregroundStyle(Color.packitLightGray)
                                    .padding(.leading, 10)
                            }
                            
                            SecureField("", text: $passwordCheck)
                                .padding(.leading, 10)
                            
                        }
                        .padding(.vertical, 13)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.packitPurple, lineWidth: 1)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 15)
                    
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            Text("닉네임")
                                .font(.custom("Pretendard-Bold", size: 15))
                                .foregroundStyle(Color.packitPurple)
                            PackitTextField(text: $nickname, placeholder: "닉네임을 입력해주세요!")
                        }
                        
                        Button(action: {
                            Task {
                                let result = await viewModel.checkDuplicateNickname(nickname: nickname)
                                canUseNickname = result
                                showNicknameAlert = true
                            }
                        }, label: {
                            Text("중복확인")
                                .font(.custom("Pretendard-SemiBold", size: 15))
                                .foregroundStyle(Color.packitPurple)
                        })
                        .frame(width: 60, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.packitLightPurple)
                        ).padding(.bottom,3)
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
                        
                        HStack(alignment: .center, spacing: 10) {
                            SelectedButton(title: "Man", isSelected: Binding(
                                get: { selectedGender == "MALE" },
                                set: { isSelected in
                                    if isSelected {
                                        selectedGender = "MALE"
                                        gender = "MALE"
                                    }
                                }
                            ))
                            
                            SelectedButton(title: "Woman", isSelected: Binding(
                                get: { selectedGender == "FEMALE" },
                                set: { isSelected in
                                    if isSelected {
                                        selectedGender = "FEMALE"
                                        gender = "FEMALE"
                                    }
                                }
                            ))
                            
                            SelectedButton(title: "Other", isSelected: Binding(
                                get: { selectedGender == "OTHER" },
                                set: { isSelected in
                                    if isSelected {
                                        selectedGender = "OTHER"
                                        gender = "OTHER"
                                    }
                                }
                            ))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 15)
                }
                
                Button(action: {
                    Task{
                        if password == passwordCheck {
                            let body = JoinReqDto(
                                email: email,
                                password: password,
                                nickname: nickname,
                                name: name,
                                age: Int(age) ?? 0,
                                gender: gender
                            )
                            
                            let result = await viewModel.signup(body: body)
                            if result {
                                coordinator.pop()
                            }
                        }
                    }
                }, label: {
                    PackitButton(title: "완료")
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                })
            }
        }.overlay {
            
            CustomAlertView(
                isPresented: $showEmailAlert,
                title: canUseEmail ? "사용가능한 이메일입니다." : "사용 불가능한 이메일입니다.",
                buttonTitle: "예") {
                    canUseEmail.toggle()
                }
            
            CustomAlertView(
                isPresented: $showNicknameAlert,
                title: canUseNickname ? "사용가능한 닉네임입니다." : "사용 불가능한 닉네임입니다.",
                buttonTitle: "예") {
                    canUseNickname.toggle()
                }
        }
    }
}
