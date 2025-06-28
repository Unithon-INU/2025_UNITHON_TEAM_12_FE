//
//  PlanPackitList.swift
//  Packit
//
//  Created by Bowon Han on 6/14/25.
//

import Foundation

final class PlanPackitListViewModel: ObservableObject {
    @Published var category: [TripItemCategory] = []
    @Published var planList = [TripItemModel]()
    
    @Published var selectedCategory: String = "필수품"
    
    var itemList: [AddTripItemReqDto] = []
    
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
            self.category = data.data
        case .failure(let statusCode, let message):
            print("[fetchTripCategory] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - 여행 아이템 생성
    func addTripItem(tripCategoryId: Int, body: AddTripItemReqDto) async {
        let result = await tripItemService.addTripItem(tripCategoryId: tripCategoryId, body: body)
        
        switch result {
        case .success(let data, _):
            print(data)
        case .failure(let statusCode, let message):
            print("[addTripItem] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - 카테고리별 여행 아이템 조회
//    func fetchTripItemWithCategory(tripCategoryId: Int) async {
//        let result = await tripItemService.fetchTripItemWithCategory(tripCategoryId: tripCategoryId)
//        
//        switch result {
//        case .success(let data, _):
////            self.planList = data.data
//        case .failure(let statusCode, let message):
//            print("[fetchTripItemWithCategory] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
//        }
//    }

    // MARK: - 여행 아이템 리스트 생성
    func addTripItems(tripId: Int, tripCategoryId: Int) async {
        itemList = planList.map { item in
            AddTripItemReqDto(
                name: item.name,
                quantity: item.quantity,
                memo: item.memo
            )
        }
        
        let body = AddTripItemsReqDto(items: itemList)
        
        let result = await tripItemService.addTripItems(tripId: tripId, tripCategoryId: tripCategoryId, body: body)
        
        switch result {
        case .success(let data, _):
            print(data.message)
        case .failure(let statusCode, let message):
            print("[addTripItems] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - 템플릿 아이템 조회
    func fetchTemplateItem(categoryId: Int) async {
        let result = await tripItemService.fetchTemplateItems(categoryId: categoryId)
        
        switch result {
        case .success(let data, _):
            self.planList = data.data.map { template in
                TripItemModel(
                    name: template.name,
                    quantity: template.defaultQuantity,
                    memo: nil
                )
            }
        case .failure(let statusCode, let message):
            print("[fetchTemplateItem] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - AI로 템플릿 아이템 생성
    func fetchTemplateItemWithAI(tripCategoryId: Int) async {
        let result = await tripItemService.fetchTemplateItemsWithAI(tripCategoryId: tripCategoryId)
        
        switch result {
        case .success(let data, _):
            self.planList = data.data.map { template in
                TripItemModel(
                    name: template.name,
                    quantity: template.quantity,
                    memo: nil
                )
            }
        case .failure(let statusCode, let message):
            print("[fetchTemplateItemWithAI] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - 아이템 삭제 (API 요청 전 사용)
    func deleteItem(id: UUID) {
        if let index = planList.firstIndex(where: { $0.id == id }) {
            planList.remove(at: index)
        }
    }
    
    // MARK: - 아이템 추가 (API 요청 전 사용)
    func addItem(item: TripItemModel) {
        planList.append(item)
    }
}
