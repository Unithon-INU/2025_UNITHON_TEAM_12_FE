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
    
//    @ObservedObject var formViewModel: PlanPackitFormViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text("언제 여행을 떠나시나요?")
                        .font(.custom("Pretendard-Bold", size: 13))
                        .padding(.leading, 4)
                    
                    Spacer()
                }.padding(.bottom, 2)
                
                CalendarView(startDate: $startDate, endDate: $endDate)
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
                
                PackitTextField(text: $tripDestination, placeholder: "여행 지역을 입력해주세요!")
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 27)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("어행 컨셉을 알려주세요!")
                    .font(.custom("Pretendard-Bold", size: 13))
                    .padding(.leading, 4)
                
                SelectTripProperty()
            }
            .padding(.top, 10)
            .padding(.bottom, 60)
            .padding(.leading, 25)
        }
        .onTapGesture {
            self.endTextEditing()
        }
        
        Button(action: {
            let formViewModel = coordinator.formViewModel

            formViewModel.reqBody.region = tripDestination
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            
            formViewModel.reqBody.startDate = startDate.map { formatter.string(from: $0) } ?? ""
            formViewModel.reqBody.endDate = endDate.map { formatter.string(from: $0) } ?? ""
            
            formViewModel.reqBody.tripType = "FAMILY"
            
            Task {
                await formViewModel.addTripItem()
                coordinator.push(.plan(.list))
            }
            
        }, label: {
            PackitButton(title: "다음")
                .padding(.horizontal, 23)
                .padding(.bottom, 10)
        })
    }
}

struct SelectTripProperty: View {
    let tags: [String] = ["혼자가는 여행1", "둘이 가는 여행2", "세심한3", "1454", "1235", "12346", "456787", "6779438", "가벼운 여행9","세심한1", "1452", "1233", "12344", "456785", "6779436", "가벼운 여행7","둘이 가는 여행8", "세심한9", "1451", "1232", "1234"]
    @State var selectedTags: [String] = []
    
    var body: some View {
        VStack {
            FlowLayout(spacing: 12, lineSpacing: 12) {
                ForEach(tags, id: \.self) { tag in
                    PackitToggleButton(
                        content: tag,
                        isSelected: selectedTags.contains(tag),
                        onTap: {
                            if selectedTags.contains(tag) {
                                selectedTags.removeAll { $0 == tag }
                            } else {
                                selectedTags.append(tag)
                            }
                        })
                }
            }
        }
    }
}
