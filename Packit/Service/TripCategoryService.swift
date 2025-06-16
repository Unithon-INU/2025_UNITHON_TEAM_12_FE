//
//  TripCategoryService.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

protocol TripCategoryServiceProtocol {
    // MARK: - 여행별 카테고리 목록 조회 API
    func fetchTripCategory(tripId: Int) async -> NetworkResult<[TripItemCategory]>
}

final class TripCategoryService: TripCategoryServiceProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol=NetworkService()) {
        self.networkService = networkService
    }
    
    // MARK: - 여행별 카테고리 목록 조회 API
    func fetchTripCategory(tripId: Int) async -> NetworkResult<[TripItemCategory]> {
        return await networkService.request(TripCategoryEndpoint.fetchTripCategories(tripId: tripId))
    }
}
