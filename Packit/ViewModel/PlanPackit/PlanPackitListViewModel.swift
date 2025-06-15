//
//  PlanPackitList.swift
//  Packit
//
//  Created by Bowon Han on 6/14/25.
//

import Foundation

final class PlanPackitListViewModel: ObservableObject {
    @Published var category: [String] = ["필수품", "의류", "세면도구", "의약품", "기타"]
    @Published var planList = [TripItem]()
    
    @Published var selectedCategory: String = "필수품"
    
    init() {
        fetchTripItemList()
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
