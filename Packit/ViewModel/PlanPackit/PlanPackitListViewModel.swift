//
//  PlanPackitList.swift
//  Packit
//
//  Created by Bowon Han on 6/14/25.
//

import Foundation

final class PlanPackitListViewModel: ObservableObject {
    @Published var category: [TripCategory] = []
    @Published var planList = [TripItemResDto]()
    
    @Published var selectedCategory: String = "필수품"
    
    private let tripCategoryService: TripCategoryServiceProtocol
    private let tripItemService: TripItemServiceProtocol
    
    init(tripCategoryService: TripCategoryServiceProtocol=TripCategoryService(),
         tripItemService: TripItemServiceProtocol=TripItemService()
    ) {
        self.tripCategoryService = tripCategoryService
        self.tripItemService = tripItemService
    }
    
    // MARK: - 여행 아이템 카테고리 조회
    func fetchTripCategory(tripId: Int) async {
        let result = await tripCategoryService.fetchTripCategory(tripId: tripId)
        
        switch result {
        case .success(let data, _):
            self.category = data
        case .failure(let statusCode, let message):
            print("[fetchTripCategory] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - 여행 아이템 생성
    func addTripItem(tripCategoryId: Int, body: AddTripItemReqDto) async {
        let result = await tripItemService.addTripItem(tripCategoryId: tripCategoryId, body: body)
        
        switch result {
        case .success(let data, let statusCode):
            print(data)
        case .failure(let statusCode, let message):
            print("[addTripItem] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - 카테고리별 여행 아이템 조회
    func fetchTripItemWithCategory(tripCategoryId: Int) async {
        let result = await tripItemService.fetchTripItemWithCategory(tripCategoryId: tripCategoryId)
        
        switch result {
        case .success(let data, _):
            self.planList = data
        case .failure(let statusCode, let message):
            print("[fetchTripItemWithCategory] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
}
