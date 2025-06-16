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
    
    @State private var isSelected: Bool = false

    var body: some View {
        VStack {
            // MARK: - 카테고리 상단 탭
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(viewModel.categories) { category in CategoryButtonComponent(
                        title: category.name,
                        isSelected: selectedCategory == category.id,
                        onTap: {
                            Task {
                                selectedCategory = category.id
                                await viewModel.fetchTripItem(tripCategoryId: selectedCategory)
                            }
                        })
                    }
                }.onAppear {
                    Task {
                        await viewModel.fetchItemCategory(tripId: tripId)
                        selectedCategory = viewModel.categories.first?.id ?? 0
                        await viewModel.fetchTripItem(tripCategoryId: selectedCategory)
                    }
                }.padding(.horizontal)
            }
            
            // MARK: - 체크박스 리스트
            ScrollView{
                VStack(spacing: 12) {
                    ForEach(viewModel.tripItems) { item in
                        SelectBoxComponent (
                            title: item.name,
                            description: item.memo,
                            isSelected: isSelected,
                            onTap: {
                                Task {
                                    isSelected.toggle()
                                    await viewModel.toggleItemStatus(tripItemId: item.id)
                                }
                            }
                        ).onAppear {
                            isSelected = item.isChecked
                        }
                    }
                }
            }
            
            Button(action: {
                if selectedCategory == viewModel.categories.last?.id {
                    Task {
                        await viewModel.fetchTripItem(tripCategoryId: selectedCategory)
                        /// - NOTE: 마지막 카테고리 일시에
                        coordinator.popToRoot()
                    }
                } else {
                    Task{
                        await viewModel.fetchTripItem(tripCategoryId: selectedCategory)
                        selectedCategory += 1
                    }
                }
            }, label: {
                PackitButton(title: "다음")
                    .padding(.horizontal, 23)
                    .padding(.bottom, 10)
            })
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(title)
    }
}
