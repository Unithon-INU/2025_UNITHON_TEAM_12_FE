//
//  PlanPackitList.swift
//  Packit
//
//  Created by Bowon Han on 6/14/25.
//

import Foundation

final class PlanPackitListViewModel: ObservableObject {
    @Published var category: [TripCategory] = []
    @Published var planList = [TripItem]()
    
    @Published var selectedCategory: String = "필수품"
    
    private let tripCategoryService: TripCategoryServiceProtocol
    
    init(tripCategoryService: TripCategoryServiceProtocol=TripCategoryService()) {
        self.tripCategoryService = tripCategoryService
        fetchTripItemList()
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
    
    func fetchTripItemList() {
        if let tripItems: [TripItem] = JSONParser.parse(fileName: "TripItem") {
            self.planList = tripItems
        } else {
            print("JSON DECODE 에러입니다.")
        }
    }
    
    func deleteTripItem(id: Int) {
        if let index = self.planList.firstIndex(where: { $0.id == id }) {
            self.planList.remove(at: index)
        }
    }
}
