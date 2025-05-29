//
//  PlanPackitTripPropertyView.swift
//  Packit
//
//  Created by Bowon Han on 5/26/25.
//

import SwiftUI

struct PlanPackitTripPropertyView: View {
    @State private var tripDestination: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text("언제 여행을 떠나시나요?")
                        .font(.custom("Pretendard", size: 13))
                        .fontWeight(.bold)
                        .padding(.leading, 4)
                    
                    Spacer()
                }.padding(.bottom, 2)
                
                CalendarView()
                    .padding(13)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.packitPurple, lineWidth: 1)
                    }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 27)
            
            VStack(alignment: .leading) {
                Text("어디로 여행을 가시나요?")
                    .font(.custom("Pretendard", size: 13))
                    .fontWeight(.bold)
                    .padding(.leading, 4)
                
                PackitTextField(text: $tripDestination, placeholder: "여행 지역을 입력해주세요!")
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 27)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("어행 컨셉을 알려주세요!")
                    .font(.custom("Pretendard", size: 13))
                    .fontWeight(.bold)
                    .padding(.leading, 4)
                
                SelectTripProperty()
            }
            .padding(.vertical, 10)
            .padding(.leading, 27)
        }
    }
}

struct SelectTripProperty: View {
    let tags: [String] = ["혼자가는 여행", "둘이 가는 여행", "세심한", "145", "123", "1234", "45678", "677943", "가벼운 여행","세심한", "145", "123", "1234", "45678", "677943", "가벼운 여행","둘이 가는 여행", "세심한", "145", "123", "1234"]
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

#Preview {
    PlanPackitTripPropertyView()
}
