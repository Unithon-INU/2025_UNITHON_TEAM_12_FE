//
//  CheckPackitListViewModel.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

final class CheckPackitListViewModel: ObservableObject {
    private let tripCategoryService: TripCategoryServiceProtocol
    private let tripItemService: TripItemServiceProtocol
    
    @Published var categories = [TripItemCategory]()
    @Published var tripItems = [TripItemResDto]()
    
    init(
        tripCategoryService: TripCategoryServiceProtocol=TripCategoryService(),
        tripItemService: TripItemServiceProtocol=TripItemService()) {
        self.tripCategoryService = tripCategoryService
        self.tripItemService = tripItemService
    }
    
    // MARK: - 아이템의 카테고리 리스트 조회
    func fetchItemCategory(tripId: Int) async {
        let result = await tripCategoryService.fetchTripCategory(tripId: tripId)
        
        switch result {
        case .success(let data, _):
            self.categories = data
        case .failure(let statusCode, let message):
            print("[fetchItemCategory] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - 카테고리 별 아이템 조회
    func fetchTripItem(tripCategoryId: Int) async {
        let result = await tripItemService.fetchTripItemWithCategory(tripCategoryId: tripCategoryId)
        
        switch result {
        case .success(let data, _):
            self.tripItems = data
        case .failure(let statusCode, let message):
            print("[fetchTripItem] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - 아이템 상태 토글 API
    func toggleItemStatus(tripItemId: Int) async {
        let result = await tripItemService.toggleItemStatus(tripItemId: tripItemId)
        
        switch result {
        case .success(let data, _):
            print(data)
        case .failure(let statusCode, let message):
            print("[toggleItemStatus] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
}
