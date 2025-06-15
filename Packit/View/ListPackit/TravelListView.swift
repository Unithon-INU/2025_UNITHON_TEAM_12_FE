//
//  TravelListView.swift
//  Packit
//
//  Created by Claude on 6/5/25.
//

import SwiftUI
import Foundation

struct TravelListView: View {
    @State private var scrollOffset: CGFloat = 0
    
    // 샘플 데이터
    let sampleTrips = [
        Trip(
            trip_id: 1,
            title: "민지와 제주 여행",
            location: "제주도",
            start_date: "2025.06.10",
            end_date: "2025.06.12",
            created_at: "2025.06.01",
            travel_type: "휴양",
            companions: 2,
            companion_type: "친구",
            user_id: 1
        ),
        Trip(
            trip_id: 2,
            title: "민지와 속초 여행",
            location: "속초",
            start_date: "2025.03.12",
            end_date: "2025.03.13",
            created_at: "2025.03.01",
            travel_type: "관광",
            companions: 2,
            companion_type: "친구",
            user_id: 1
        ),
        Trip(
            trip_id: 3,
            title: "민지와 경주 여행",
            location: "경주",
            start_date: "2025.02.12",
            end_date: "2025.02.12",
            created_at: "2025.02.01",
            travel_type: "문화",
            companions: 2,
            companion_type: "친구",
            user_id: 1
        ),
        Trip(
            trip_id: 4,
            title: "민지와 서울 여행",
            location: "서울",
            start_date: "2025.01.12",
            end_date: "2025.01.13",
            created_at: "2025.01.01",
            travel_type: "도시",
            companions: 2,
            companion_type: "친구",
            user_id: 1
        ),
        Trip(
            trip_id: 5,
            title: "민지와 전주 여행",
            location: "전주",
            start_date: "2024.12.12",
            end_date: "2024.12.12",
            created_at: "2024.12.01",
            travel_type: "맛집",
            companions: 2,
            companion_type: "친구",
            user_id: 1
        ),
        Trip(
            trip_id: 6,
            title: "민지와 전주 여행",
            location: "전주",
            start_date: "2024.12.12",
            end_date: "2024.12.12",
            created_at: "2024.12.01",
            travel_type: "맛집",
            companions: 2,
            companion_type: "친구",
            user_id: 1
        ),
        Trip(
            trip_id: 7,
            title: "민지와 전주 여행",
            location: "전주",
            start_date: "2024.12.12",
            end_date: "2024.12.12",
            created_at: "2024.12.01",
            travel_type: "맛집",
            companions: 2,
            companion_type: "친구",
            user_id: 1
        ),
        Trip(
            trip_id: 8,
            title: "민지와 전주 여행",
            location: "전주",
            start_date: "2024.12.12",
            end_date: "2024.12.12",
            created_at: "2024.12.01",
            travel_type: "맛집",
            companions: 2,
            companion_type: "친구",
            user_id: 1
        )
    ]
    
    // 예정된 여행과 과거 여행 분리
    var upcomingTrips: [Trip] {
        sampleTrips.filter { !$0.isBeen }
    }
    
    var pastTrips: [Trip] {
        sampleTrips.filter { $0.isBeen }
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // 예정된 섹션의 높이를 계산하는 함수
    private func calculateTopSpacing() -> CGFloat {
        let headerHeight: CGFloat = 59 // 헤더 높이 (텍스트 + spacing)
        let sectionTitleHeight: CGFloat = 39 // "예정된 짐싸기" 제목 높이
        let cardHeight: CGFloat = 168 // 카드 최대 높이
        let additionalSpacing: CGFloat = 50 // 기타 패딩 및 여백
        let requestedGap: CGFloat = 30 // 요청된 간격
        
        if !upcomingTrips.isEmpty {
            // 예정된 여행이 있을 때: 전체 높이 + 40
            return headerHeight + sectionTitleHeight + cardHeight + additionalSpacing + requestedGap
        } else {
            // 예정된 여행이 없을 때: 빈 상태 높이 + 40
            let emptyStateHeight: CGFloat = 200
            return headerHeight + emptyStateHeight + additionalSpacing + requestedGap
        }
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    VStack(spacing: 34) {
                        // 헤더
                        HStack(spacing: 21) {
                            Image("home")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 22)
                            
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
                        
                        // 예정된 짐 싸기 섹션 (고정)
                        if !upcomingTrips.isEmpty {
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
                                        ForEach(upcomingTrips) { trip in
                                            NavigationLink(destination: ListDetailView(title: trip.title)) {
                                                ListCardComponentView(trip: trip)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                        else {
                            // 예정된 여행이 없을 때
                            VStack(spacing: 10) {
                                Image("clock")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.gray)
                                Text("예정된 여행이 없습니다")
                                    .font(.custom("Pretendard", size: 16))
                                    .foregroundColor(.gray)
                                Text("새로운 여행을 계획해보세요!")
                                    .font(.custom("Pretendard", size: 14))
                                    .foregroundColor(.gray)
                            }
                            .frame(height: 200)
                        }
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .zIndex(0)
                    
                    // 스크롤 가능한 과거 기록 섹션 (오버레이)
                    ScrollView {
                        VStack {
                            // 예정된 짐싸기와의 공백
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: calculateTopSpacing())
                            
                            // 과거 짐 싸기 기록 섹션
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
                                
                                if !pastTrips.isEmpty {
                                    LazyVGrid(columns: columns, spacing: 19) {
                                        ForEach(pastTrips) { trip in
                                            NavigationLink(destination: ListDetailView(title: trip.title)) {
                                                ListCardComponentView(trip: trip)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                    .padding(.bottom, 50)
                                }
                                else {
                                    // 과거 여행이 없을 때
                                    VStack(spacing: 10) {
                                        Image("list")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(.gray)
                                        Text("아직 완료된 여행이 없습니다")
                                            .font(.custom("Pretendard", size: 16))
                                            .foregroundColor(.gray)
                                        Text("첫 번째 여행을 떠나보세요!")
                                            .font(.custom("Pretendard", size: 14))
                                            .foregroundColor(.gray)
                                    }
                                    .frame(height: 200)
                                    .padding(.bottom, 50)
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
                    .background(Color.clear)
                    .zIndex(1)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
