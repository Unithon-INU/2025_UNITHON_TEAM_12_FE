//
//  MainView.swift
//  Packit
//
//  Created by Bowon Han on 5/20/25.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    @StateObject private var navigationCoordinator = NavigationCoordinator()

    var body: some View {
        NavigationStack(path: $navigationCoordinator.path) {
            VStack {
                HStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .padding(.leading, 25)
                        .padding(.bottom, 10)
                    
                    Spacer()
                }
                
                // MARK: - MainButtonView HStack
                HStack(spacing: 21) {
                    Button(action: {
                        navigationCoordinator.push(.plan(.title))
                    }, label: {
                        MainButtonView(
                            title: "짐싸기 계획하기",
                            description: "어떤 짐을 챙길지 함께 \n정해보아요!",
                            highlight: nil,
                            iconName: "package"
                        )
                    })
                    
                    /// - NOTE: 남은 짐 챙기기, 계획 완성하기 부분 처리 방법 생각해보기
                    if let trip = viewModel.tripList.first {
                        Button(action: {
                            navigationCoordinator.push(.plan(.title))
                        }, label: {
                            MainButtonView(
                                title: "남은 짐 챙기기",
                                description: "아직 완성되지 않은",
                                highlight: trip.title,
                                iconName: "packageTag"
                            )
                        })
                    }
                }
                .frame(height: 120)
                
                if let trip = viewModel.tripList.first {
                    UpcomingTrip(trip: trip)
                } else {
                    /// - NOTE: 다가오는 여정 없을 시 다른 뷰
                }
                
                PackingListView(tripList: viewModel.tripList)
            }.navigationDestination(for: AppRoute.self) { $0.destinationView() }
        }
        .onAppear {
            Task{
                await viewModel.fetchMyTrips()
            }
        }
        .task(id: navigationCoordinator.path) {
            await viewModel.fetchMyTrips()
        }
        .environmentObject(navigationCoordinator)
    }
}

// MARK: - "다가오는 여정" View
struct UpcomingTrip: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    let trip: TripResDto?
    
    var body: some View {
        HStack {
            Text("다가오는 여정")
                .font(.custom("Pretendard-Bold", size: 15))
                .padding(.leading, 40)
                .padding(.top)
            
            Spacer()
        }

        ZStack(alignment: .bottom) {
            VStack {
                HStack(alignment: .center,spacing: 15) {
                    if let trip = trip {
                        Image(systemName: "pin.fill")
                            .resizable()
                            .frame(width: 12, height: 20)
                            .foregroundStyle(Color.packitPurple)
                        
                        Text(trip.title)
                            .font(.custom("Pretendard-SemiBold", size: 18))
                        
                        Spacer()
                        
                        Text(trip.startDate.toDateString() ?? "")
                            .font(.custom("Pretendard-Thin", size: 20))
                    }
                    
                    else {
                        Text("계획된 여정이 없습니다! \n여행 일정을 등록해주세요!")
                            .font(.custom("Pretendard-SemiBold", size: 18))
                    }
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
            
            // MARK: - 다가오는 여정의 짐챙기기 시작 버튼
            if let trip = trip {
                Button(action: {
                    coordinator.push(.checkList(.start(title: trip.title)))
                }, label: {
                    Text("\(trip.title) 짐 챙기기 START!")
                        .foregroundStyle(.white)
                        .font(.custom("Pretendard-Bold", size: 15))
                        .padding([.leading, .trailing], 30)
                        .padding([.top, .bottom], 12)
                        .background(
                            RoundedRectangle(cornerRadius: 13)
                                .fill(Color.packitPurple)
                                .shadow(radius: 3)
                        )
                        .offset(CGSize(width: 0, height: 20))
                })
            }
        }.padding(.bottom, 15)
    }
}

// MARK: - "짐 챙기기 기록" View
struct PackingListView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    let tripList: [TripResDto]
    
    var body: some View {
        HStack {
            Text("짐 챙기기 기록")
                .font(.custom("Pretendard-Bold", size: 15))
                .padding(.leading, 40)
                .padding(.top)
            
            Spacer()
        }
        
        /// - NOTE: 짐챙기기 기록 리스트에서 Scrollview 내부 버튼 클릭 시 버벅이는 현상
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 18) {
                    ForEach(tripList) { trip in
                        Button(action: {
                            coordinator.push(.trip(.tripDetail(title: trip.title)))
                        }, label: {
                            PackingListCell(viewModel: PackingListCellViewModel(trip: trip))
                        })
                    }
                }
                .padding([.leading, .trailing, .top], 15)
            }
            .scrollIndicators(.hidden)
        
            Button(action: {
                coordinator.push(.trip(.tripList))
            }, label: {
                HStack {
                    Spacer()
                    
                    Text("더보기")
                        .font(.custom("Pretendard-SemiBold", size: 16))
                        .foregroundStyle(Color.packitPurple)
                    
                    Image(systemName: "greaterthan")
                        .foregroundStyle(Color.packitPurple)
                }
                .padding([.trailing, .bottom], 12)
            })
        }
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.packitPurple,lineWidth: 1)
                .shadow(radius: 3)
        }
        .padding([.leading, .trailing], 30)
        .frame(maxHeight: 230)
    }
}
