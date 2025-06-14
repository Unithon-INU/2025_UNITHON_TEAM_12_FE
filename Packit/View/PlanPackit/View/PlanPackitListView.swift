//
//  PlanPackitListView.swift
//  Packit
//
//  Created by Bowon Han on 6/14/25.
//

import SwiftUI

struct PlanPackitListView: View {
    @ObservedObject private var viewModel = PlanPackitListViewModel()
    @State private var addListText: String = ""
    @State private var selectedCategory: String = "샤워용품"
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 14) {
                // MARK: - 상단 카테고리 탭
                HStack(spacing: 5) {
                    ForEach(viewModel.category, id: \.self) { category in
                        Button(action: {
                            selectedCategory = category
                        }, label: {
                            Text(category)
                                .font(.custom("Pretendard-Bold", size: 14))
                                .padding(.vertical, 5)
                                .padding(.horizontal)
                                .foregroundStyle(selectedCategory==category ? Color.white : Color.packitCharcoal)
                                .background {
                                    RoundedRectangle(cornerRadius: 3)
                                        .fill(selectedCategory==category ? Color.packitPurple : Color.white)
                                }
                        })
                    }
                }
                .padding(5)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.packitLightGray)
                }
                
                // MARK: - 물품 추가 입력 창
                PackitTextField(text: $addListText, placeholder: "추가할 물품을 입력해주세요!")
                    .padding(.horizontal)
                
                // MARK: - 물품 리스트 뷰
                LazyVStack {
                    ScrollView{
                        ForEach(viewModel.planList, id: \.self) { list in
                            ZStack(alignment: .topTrailing) {
                                HStack(spacing: 15) {
                                    Image("package")
                                        .padding(.leading, 10)
                                    
                                    VStack(alignment: .leading) {
                                        Text(list.itemName)
                                            .font(.custom("Pretendard-SemiBold", size: 16))
                                        
                                        if let list = list.notes {
                                            Text(list)
                                                .padding(.top, 4)
                                                .font(.custom("Pretendard-Light", size: 14))
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                }.frame(minHeight: 50)
                                
                                Image(systemName: "x.circle")
                            }
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.packitLightPurple)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
                PackitButton(title: "다음")
                    .padding(.horizontal, 20)
                    .padding(.bottom, 15)         
            }
        }
    }
}

#Preview {
    PlanPackitListView()
}
