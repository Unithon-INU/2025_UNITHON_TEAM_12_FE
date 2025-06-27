//
//  PlanPackitTripPropertyView.swift
//  Packit
//
//  Created by Bowon Han on 5/26/25.
//

import SwiftUI

struct PlanPackitTripPropertyView: View {
    @State private var tripDestination: String = ""
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    @State private var startDate: Date? = nil
    @State private var endDate: Date? = nil
    
    @State private var tripType = TripType(index: "")
    
    @FocusState private var isTextFieldFocused: Bool
            
    var body: some View {
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
        .padding(.horizontal, 30)
        
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("언제 여행을 떠나시나요?")
                            .font(.custom("Pretendard-Bold", size: 13))
                            .padding(.leading, 4)
                        
                        Spacer()
                    }.padding(.bottom, 2)
                    
                    ScrollableCalendarView(startDate: $startDate, endDate: $endDate)
                        .frame(height: 430)
                        .padding(.vertical, 15)
                        .padding(.horizontal,10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.packitPurple, lineWidth: 1)
                        }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 27)
                
                VStack(alignment: .leading) {
                    Text("어디로 여행을 가시나요?")
                        .font(.custom("Pretendard-Bold", size: 13))
                        .padding(.leading, 4)
                    
                    ZStack(alignment: .leading) {
                        if tripDestination.isEmpty {
                            Text("여행 지역을 입력해주세요!")
                                .font(.custom("Pretendard-Medium", size: 16))
                                .foregroundStyle(Color.packitLightGray)
                                .padding(.leading, 10)
                        }
                        
                        TextField("", text: $tripDestination)
                            .padding(.leading, 10)
                    }
                    .padding(.vertical, 13)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.packitPurple, lineWidth: 1)
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 27)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("어행 컨셉을 알려주세요!")
                        .font(.custom("Pretendard-Bold", size: 13))
                        .padding(.leading, 4)
                    
                    SelectTripProperty(selectedTag: $tripType)
                }
                .padding(.top, 10)
                .padding(.bottom, 60)
                .padding(.leading, 25)
            }
        }
        
        Button(action: {
            let formViewModel = coordinator.formViewModel

            formViewModel.reqBody.region = tripDestination
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            
            formViewModel.reqBody.startDate = startDate.map { formatter.string(from: $0) } ?? ""
            formViewModel.reqBody.endDate = endDate.map { formatter.string(from: $0) } ?? ""
            
            formViewModel.reqBody.tripType = self.tripType?.toString() ?? "FAMILY"
            
            Task {
                await formViewModel.addTrip()
                coordinator.push(.plan(.list))
            }
            
        }, label: {
            Text("다음")
                .font(.custom("Pretendard-Bold", size: 20))
                .foregroundStyle(startDate == nil || endDate == nil || tripDestination.isEmpty ? Color.packitPurple : .white)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(startDate == nil || endDate == nil || tripDestination.isEmpty ? Color.packitLightPurple : Color.packitPurple)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 15)
        }).disabled(startDate == nil || endDate == nil || tripDestination.isEmpty)
    }
}

struct SelectTripProperty: View {
    let tags: [String] = TripType.orderedCases.map { $0.toUIName() }
    
    @Binding var selectedTag: TripType?
    
    var body: some View {
        VStack {
            FlowLayout(spacing: 12, lineSpacing: 12) {
                ForEach(tags, id: \.self) { tag in
                    PackitToggleButton(
                        content: tag,
                        isSelected: selectedTag==TripType(index: tag),
                        onTap: {
//                            if selectedTags.contains(tag) {
//                                selectedTags.removeAll { $0 == tag }
//                            } else {
//                                selectedTags.append(tag)
//                            }
                            selectedTag = TripType(index: tag) ?? .other
                        })
                }
            }
        }
    }
}
