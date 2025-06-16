//
//  TripListDetailViewModel.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

final class TripListDetailViewModel: ObservableObject {
    private let tripCategoryService: TripCategoryServiceProtocol
    private let tripItemService: TripItemServiceProtocol
        
    @Published var categories = [TripItemCategory]()
    @Published var tripItems = [TripItemResDto]()
    
    init(
        tripCategoryService: TripCategoryServiceProtocol=TripCategoryService(),
        tripItemService: TripItemServiceProtocol=TripItemService()
    ) {
        self.tripCategoryService = tripCategoryService
        self.tripItemService = tripItemService
    }
    
    // MARK: - 여행 아이템 카테고리 조회
    func fetchTripItemCategory(tripId: Int) async {
        let result = await tripCategoryService.fetchTripCategory(tripId: tripId)
        
        switch result {
        case .success(let data, _):
            self.categories = data
        case .failure(let statusCode, let message):
            print("[fetchTripItemCategory] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - 여행 아이템 조회
    func fetchTripItem(tripCategoryId: Int) async {
        let result = await tripItemService.fetchTripItemWithCategory(tripCategoryId: tripCategoryId)
        
        switch result {
        case .success(let data, _):
            self.tripItems = data
        case .failure(let statusCode, let message):
            print("[fetchTripItem] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
}
