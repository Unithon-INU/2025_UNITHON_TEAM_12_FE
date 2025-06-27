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
    @Published var tripProgressRate: Double = 0.0
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
            print(data.data)
            self.tripProgressRate = data.data.progressPercent
            if let index = tripItems.firstIndex(where: { $0.id == tripItemId }) {
                tripItems[index].isChecked.toggle()
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
            self.tripProgressRate = data.data.progressRate
        case .failure(let statusCode, let message):
            print("[fetchTripProgressRate] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - 체크되지 않은 아이템 추가 메서드
    func addUncheckedItem(items: [TripItemResDto]) {
        items.forEach {
            unCheckedItems.append($0)
        }
    }
    
    // MARK: - 체크되지 않은 아이템 추가되었다가 다시 제거하는 메서드
    func deleteInUncheckedItem(item: TripItemResDto) {
        
    }
}
