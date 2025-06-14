//
//  PlanPackitList.swift
//  Packit
//
//  Created by Bowon Han on 6/14/25.
//

import Foundation

final class PlanPackitListViewModel: ObservableObject {
    @Published var category: [String] = ["샤워용품", "의류", "화장품", "생활용품", "기타"]
    @Published var planList: [PlanPackitModel] = [PlanPackitModel(itemName: "클렌징폼", notes: "용량을 확인해주세요!"), PlanPackitModel(itemName: "양말", notes: nil)]
    
    @Published var selectedCategory: String = "샤워용품"
}
