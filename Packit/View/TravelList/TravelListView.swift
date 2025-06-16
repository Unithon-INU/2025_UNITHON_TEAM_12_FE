//
//  TravelListView.swift
//  Packit
//
//  Created by Claude on 6/5/25.
//

import SwiftUI

struct TravelListView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    @StateObject private var viewModel = TravelListViewModel()

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack(spacing: 34) {
            headerView

            upcomingSection
            
            pastSection
        }
        .padding(.bottom, 50)
        .background(Color.white)
        .navigationBarHidden(true)
    }

    private var headerView: some View {
        HStack(spacing: 21) {
            Button(action: {
                coordinator.popToRoot()
            }) {
                Image("home")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 22)
            }

            Text("짐 리스트")
                .font(.custom("Pretendard-bold", size: 25))
                .foregroundColor(.black)

            Spacer()

            Image("user")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 19)
        }
        .padding(.horizontal)
    }

    private var upcomingSection: some View {
        Group {
            if !viewModel.upcomingTrips.isEmpty {
                VStack(alignment: .leading, spacing: 11) {
                    HStack {
                        Image("clock")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 22)
                        Text("예정된 짐 싸기")
                            .font(.custom("Pretendard-bold", size: 16))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 19) {
                            ForEach(viewModel.upcomingTrips) { trip in
                                Button {
                                    coordinator.push(.trip(.tripDetail(title: trip.title)))
                                } label: {
                                    ListCardComponentView(trip: trip)
                                }
                            }
                        }
                        .padding()
                    }
                }
            } else {
                VStack(spacing: 10) {
                    Image("clock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    Text("예정된 여행이 없습니다")
                        .font(.custom("Pretendard", size: 16))
                    Text("새로운 여행을 계획해보세요!")
                        .font(.custom("Pretendard", size: 14))
                }
                .foregroundColor(.gray)
                .frame(height: 200)
            }
        }
    }

    private var pastSection: some View {
        VStack(alignment: .leading, spacing: 11) {
            HStack {
                Image("list")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 21)
                Text("과거 짐 싸기 기록")
                    .font(.custom("Pretendard-bold", size: 16))
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 20)

            if !viewModel.pastTrips.isEmpty {
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 19) {
                        ForEach(viewModel.pastTrips) { trip in
                            Button {
                                coordinator.push(.trip(.tripDetail(title: trip.title)))
                            } label: {
                                ListCardComponentView(trip: trip)
                            }
                        }
                    }
                    .padding()
                }
            } else {
                VStack(spacing: 10) {
                    Image("list")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    Text("아직 완료된 여행이 없습니다")
                        .font(.custom("Pretendard", size: 16))
                    Text("첫 번째 여행을 떠나보세요!")
                        .font(.custom("Pretendard", size: 14))
                }
                .foregroundColor(.gray)
                .frame(height: 200)
            }
        }
        .background(
            UnevenRoundedRectangle(
                topLeadingRadius: 15,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 15
            )
            .fill(Color.packitLightPurple)
            .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: -5)
        )
    }
}
