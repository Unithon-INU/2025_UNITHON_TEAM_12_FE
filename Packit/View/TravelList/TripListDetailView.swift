//
//  ListDetailView.swift
//  Packit
//
//  Created by 이예나 on 5/25/25.
//

import SwiftUI

struct TripListDetailView: View {
    let title: String
    let tripId: Int
    
    @ObservedObject var viewModel = TripListDetailViewModel()
    @State private var selectedCategory: Int = 0
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    var body: some View {
        VStack(spacing:22) {
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
                }.onAppear {
                    Task {
                        await viewModel.fetchTripItemCategory(tripId: tripId)
                        selectedCategory = viewModel.categories.first?.id ?? 0
                        await viewModel.fetchTripItem(tripCategoryId: selectedCategory)
                    }
                }.padding(.horizontal)
            }
            
            VStack(spacing: 12) {
                ForEach(viewModel.tripItems) { item in
                    BoxComponent (title: item.name, description: item.memo ?? "")
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}
