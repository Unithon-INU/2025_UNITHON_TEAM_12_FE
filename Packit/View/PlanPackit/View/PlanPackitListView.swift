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
    @State private var selectedCategory: Int = 0
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    @State private var templateCategory: Int = 1
    
    @State private var tripId: Int = 0

    var body: some View {
        VStack(spacing: 14) {
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
            
            // MARK: - 상단 카테고리 탭
            HStack(spacing: 5) {
                ForEach(viewModel.category) { category in
                    Button(action: {
//                        Task{
//                            selectedCategory = category.id
//                            await viewModel.fetchTripItemWithCategory(tripCategoryId: selectedCategory)
//                        }
                    }, label: {
                        Text(category.name)
                            .font(.custom("Pretendard-Bold", size: 12))
                            .padding(.vertical, 5)
                            .padding(.horizontal, 12)
                            .foregroundStyle(selectedCategory == category.id ? Color.white : Color.packitCharcoal)
                            .background {
                                RoundedRectangle(cornerRadius: 3)
                                    .fill(selectedCategory == category.id ? Color.packitPurple : Color.white)
                            }
                    })
                }
            }
            .padding(5)
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.packitLightGray)
            }
            
            HStack(spacing: 10) {
                // MARK: - 물품 추가 입력 창
                PackitTextField(text: $addListText, placeholder: "추가할 물품을 입력해주세요!")
                
                Button(action: {
                    let item = TripItemModel(name: addListText, quantity: 1, memo: nil)
                    viewModel.addItem(item: item)
                    addListText = ""
                }, label: {
                    Text("추가")
                        .font(.custom("Pretendard-SemiBold", size: 13))
                        .foregroundStyle(Color.packitPurple)
                        
                })
                .frame(width: 60, height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.packitLightPurple)
                )
            }.padding(.horizontal)

            
            // MARK: - 물품 리스트 뷰
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.planList) { list in
                        ZStack(alignment: .topTrailing) {
                            HStack(spacing: 15) {
                                Image("package")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 35)
                                    .padding(.leading, 10)
                                
                                VStack(alignment: .leading) {
                                    Text(list.name)
                                        .font(.custom("Pretendard-SemiBold", size: 16))
                                    
                                    if let notes = list.memo {
                                        Text(notes)
                                            .padding(.top, 0.1)
                                            .font(.custom("Pretendard-Light", size: 14))
                                    }
                                }
                                
                                Spacer()
                                
                            }.frame(minHeight: 45)
                            Button(action: {
                                viewModel.deleteItem(id: list.id)
                            }, label: {
                                Image(systemName: "x.circle")
                                    .foregroundStyle(Color.black)
                            })
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.packitLightPurple)
                        }
                    }
                }
            }.padding(.horizontal)
                            
            Button(action: {
                if selectedCategory == viewModel.category.last?.id {
                    Task {
                        await viewModel.addTripItems(tripId: self.tripId, tripCategoryId: selectedCategory)
                        /// - NOTE: 마지막 카테고리 일시에
                        coordinator.popToRoot()
                    }
                } else {
                    Task{
                        await viewModel.addTripItems(tripId: self.tripId, tripCategoryId: selectedCategory)
                        selectedCategory += 1
                        templateCategory += 1
                        await viewModel.fetchTemplateItem(categoryId: templateCategory)
                    }
                }
            }, label: {
                PackitButton(title: selectedCategory == viewModel.category.last?.id ? "완료" : "다음")
                    .padding(.horizontal, 20)
                    .padding(.bottom, 15)
            })
        }.onAppear {
            Task {
                self.tripId = coordinator.formViewModel.result.id
                await viewModel.fetchTripCategory(tripId: self.tripId)
                selectedCategory = viewModel.category.first?.id ?? 0
                await viewModel.fetchTemplateItem(categoryId: templateCategory)
            }
        }
    }
}
