//
//  TripItemService.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

protocol TripItemServiceProtocol {
    // MARK: - 여행 짐 추가 API
    func addTripItem(tripCategoryId: Int, body: AddTripItemReqDto) async -> NetworkResult<TripItemResDto>
}

final class TripItemService: TripItemServiceProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol=NetworkService()) {
        self.networkService = networkService
    }
    
    func addTripItem(tripCategoryId: Int, body: AddTripItemReqDto) async -> NetworkResult<TripItemResDto> {
        return await networkService.request(TripItemEndpoint.addTripItem(tripCategoryId: tripCategoryId, body: body))
    }
}
