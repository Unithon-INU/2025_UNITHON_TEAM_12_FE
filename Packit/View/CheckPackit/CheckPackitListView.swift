//
//  CheckPackitListView.swift
//  Packit
//
//  Created by Bowon Han on 6/15/25.
//

import SwiftUI

struct CheckPackitListView: View {
    let title: String
    let tripId: Int
    
    @EnvironmentObject var coordinator: NavigationCoordinator
    @ObservedObject var viewModel = CheckPackitListViewModel()

    @State private var selectedCategory: Int = 0
    
    @State private var showPopup: Bool = false
    
    var body: some View {
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
                
                Text(title)
                    .font(.custom("Pretendard-Bold", size: 15))
                    .padding(.horizontal)
                
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 30)
            
            HStack(alignment: .center) {
                Text(String(Int(viewModel.tripProgressRate))+"%")
                    .font(.custom("Pretendard-Medium", size: 20))
                
                ProgressView(value: viewModel.tripProgressRate)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color.packitPurple))
            }
            .onAppear {
                Task {
                    await viewModel.fetchTripProgressRate(tripId: tripId)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            
            // MARK: - 카테고리 상단 탭
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(viewModel.categories) { category in
                            CategoryButtonComponent(
                                title: category.name,
                                isSelected: selectedCategory == category.id,
                                onTap: {
                                    Task {
                                        selectedCategory = category.id
                                        await viewModel.fetchTripItem(tripCategoryId: selectedCategory)
                                    }
                                }
                            )
                        }
                    }
                    .onAppear {
                        Task {
                            await viewModel.fetchItemCategory(tripId: tripId)
                            selectedCategory = viewModel.categories.first?.id ?? 0
                            await viewModel.fetchTripItem(tripCategoryId: selectedCategory)
                        }
                    }.padding(.horizontal)
                }
                .onAppear {
                    proxy.scrollTo(selectedCategory, anchor: .center)
                }
                .onChange(of: selectedCategory) { _, newValue in
                    withAnimation {
                        proxy.scrollTo(newValue, anchor: .center)
                    }
                }
            }
            
            // MARK: - 체크박스 리스트
            ScrollView{
                VStack(spacing: 12) {
                    ForEach(viewModel.tripItems) { item in
                        SelectBoxComponent (
                            title: item.name,
                            description: item.memo,
                            isSelected: item.isChecked,
                            onTap: {
                                Task {
                                    await viewModel.toggleItemStatus(tripItemId: item.id)
                                    await viewModel.fetchTripProgressRate(tripId: tripId)
                                }
                            }
                        )
                    }
                }
            }
            
            Button(action: {
                /// - NOTE: 마지막 카테고리 일시에
                if selectedCategory == viewModel.categories.last?.id {
                    Task {
                        await viewModel.fetchTripItem(tripCategoryId: selectedCategory)
                        
                        viewModel.addUncheckedItem(items: viewModel.tripItems.filter { $0.isChecked == false })
                        withAnimation {
                            showPopup = true
                        }
                    }
                } else {
                    Task{
                        selectedCategory += 1
                        await viewModel.fetchTripItem(tripCategoryId: selectedCategory)
                        
                        viewModel.addUncheckedItem(items: viewModel.tripItems.filter { $0.isChecked == false })
                    }
                }
            }, label: {
                PackitButton(title: "다음")
                    .padding(.horizontal, 23)
                    .padding(.bottom, 10)
            })
        }
        .overlay {
            UnCheckedPopup(
                isPresented: $showPopup,
                onTap: {
                    coordinator.popToRoot()
                },
                unCheckedItems: viewModel.unCheckedItems
            ).animation(.easeOut(duration: 0.3), value: showPopup)
        }
    }
}
