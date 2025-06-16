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
    
    var body: some View {
        VStack(spacing:22) {
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
                    await viewModel.fetchTripItemCategory(tripId: tripId)
                }
            }
            
            VStack(spacing: 12) {
                ForEach(viewModel.tripItems) { item in
                    BoxComponent (title: item.name, description: item.memo ?? "")
                }
            }
        }
        .onAppear {
            Task {

            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(title)
    }
}
