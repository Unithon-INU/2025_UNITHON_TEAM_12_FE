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
    private let tripService: TripServiceProtocol
    
    @Published var categories = [TripItemCategory]()
    @Published var tripItems = [TripItemResDto]()
    @Published var tripProgressRate: Int = 0
    @Published var unCheckedItems = [TripItemResDto]()
    
    init(
        tripCategoryService: TripCategoryServiceProtocol=TripCategoryService(),
        tripItemService: TripItemServiceProtocol=TripItemService(),
        tripService: TripServiceProtocol=TripService()
    ) {
        self.tripCategoryService = tripCategoryService
        self.tripItemService = tripItemService
        self.tripService = tripService
    }
    
    // MARK: - 아이템의 카테고리 리스트 조회
    func fetchItemCategory(tripId: Int) async {
        let result = await tripCategoryService.fetchTripCategory(tripId: tripId)
        
        switch result {
        case .success(let data, _):
            self.categories = data.data
        case .failure(let statusCode, let message):
            print("[fetchItemCategory] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - 카테고리 별 아이템 조회
    func fetchTripItem(tripCategoryId: Int) async {
        let result = await tripItemService.fetchTripItemWithCategory(tripCategoryId: tripCategoryId)
        
        switch result {
        case .success(let data, _):
            self.tripItems = data.data
        case .failure(let statusCode, let message):
            print("[fetchTripItem] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - 아이템 상태 토글 API
    func toggleItemStatus(tripItemId: Int) async {
        let result = await tripItemService.toggleItemStatus(tripItemId: tripItemId)

        switch result {
        case .success(let data, _):
            self.tripProgressRate = data.data.progressPercent
            if let index = tripItems.firstIndex(where: { $0.id == tripItemId }) {
                tripItems[index].isChecked.toggle()
                
                let item = tripItems[index]
                if item.isChecked {
                    unCheckedItems.removeAll { $0.id == item.id }
                } else {
                    if !unCheckedItems.contains(where: { $0.id == item.id }) {
                        unCheckedItems.append(item)
                    }
                }
            }
        case .failure(let statusCode, let message):
            print("[toggleItemStatus] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - 여행 아이템 진행률 API
    func fetchTripProgressRate(tripId: Int) async {
        let result = await tripService.fetchTripProgress(tripId: tripId)
        
        switch result {
        case .success(let data, _):
            self.tripProgressRate = data.data.progressPercent
        case .failure(let statusCode, let message):
            print("[fetchTripProgressRate] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - 체크되지 않은 아이템 추가 메서드
    func addUncheckedItem(items: [TripItemResDto]) {
        print(items)
        for item in items {
            if !unCheckedItems.contains(where: { $0.id == item.id }) {
                unCheckedItems.append(item)
            }
        }
    }
    
    func deleteItems(body: DeleteItemsReqDto) async {
        let result = await tripItemService.deleteItems(body: body)
        
        switch result {
        case .success(let data, _):
            print(data.message)
        case .failure(let statusCode, let message):
            print("[deleteItems] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
}
