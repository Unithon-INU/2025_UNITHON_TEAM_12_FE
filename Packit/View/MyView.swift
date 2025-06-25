//
//  MyView.swift
//  Packit
//
//  Created by 이예나 on 6/25/25.
//

import SwiftUI


struct MyView: View {
    let title: String
    @ObservedObject var viewModel = MyViewModel()
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    var body: some View {
        VStack {
            // MARK: - 네비게이션 바
            HStack {
                Button(action: {
                    coordinator.pop()
                }) {
                    Image("home")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                }

                Text(title)
                    .font(.custom("Pretendard-Bold", size: 25))
                    .padding(.horizontal)

                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 30)

            // MARK: - 개인정보
            VStack(spacing: 5) {
                Image("myProfile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                
                TextStyleView(
                    title: viewModel.myInfo.nickname,
                    subtitle: viewModel.myInfo.email
                )
            }
            .padding(.top, 30)

            // MARK: - 여행 요약 정보
            ZStack {
                Rectangle()
                    .fill(Color.packitLightPurple)
                    .frame(height: 98)
                    .padding(.horizontal, 27)
                    .cornerRadius(17)

                HStack(spacing: 25) {
                    TextStyleView(
                        title: "\(viewModel.myTrip.totalCount)",
                        subtitle: "총 여행 횟수"
                    )

                    Divider()
                        .frame(width: 1, height: 70)
                        .foregroundStyle(Color.packitPurple)

                    TextStyleView(
                        title: "\(viewModel.myTrip.plannedCount)",
                        subtitle: "계획 중인 여행"
                    )

                    Divider()
                        .frame(width: 1, height: 70)
                        .foregroundStyle(Color.packitPurple)

                    TextStyleView(
                        title: "\(viewModel.myTrip.completedCount)",
                        subtitle: "완료한 여행"
                    )
                }
            }
            .padding(.top, 35)

            // MARK: - 여행 계획 버튼
            Button(action: {
                coordinator.push(.plan(.title))
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

            // MARK: - 짐 싸러 가기 버튼
            Button(action: {
                coordinator.push(.trip(.tripList))
            }) {
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

            // MARK: - 로그아웃 버튼
            Button(action: {
                handleLogout()
            }) {
                HStack {
                    Text("로그아웃")
                        .font(.custom("Pretendard-Light", size: 16))
                        .foregroundStyle(.red)

                    Spacer()

                    Image(systemName: "chevron.right")
                        .foregroundColor(.red)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.red.opacity(0.3), lineWidth: 1)
                )
            }
            .padding(.horizontal, 27)
            .padding(.bottom, 30)
        }
        .background(Color(hex: "#F4F3F8"))
        .onAppear {
            Task {
                await viewModel.fetchMyInfo()
                await viewModel.fetchMyTrip()
            }
        }
    }

    private func handleLogout() {
        // 로그아웃 로직 추가 가능
        coordinator.popToRoot()
    }
}



struct TextStyleView: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(spacing: 9) {
            Text(title)
                .font(.custom("Pretendard-SemiBold", size: 22))
                .foregroundColor(.black)
            Text(subtitle)
                .font(.custom("Pretendard-Light", size: 12))
                .foregroundColor(Color.packitDarkGray)
        }
    }
}
