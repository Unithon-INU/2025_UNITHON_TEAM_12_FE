//
//  TripServoce.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

protocol TripServiceProtocol {
    // MARK: - 내 여행 목록 조회 API
    func fetchMyTrips() async -> NetworkResult<[TripResDto]>
    
    // MARK: - 여행 생성 API
    func addTrip(body: AddTripReqDto) async -> NetworkResult<TripResDto>
}

final class TripService: TripServiceProtocol {
    private let networkService: NetworkService
    
    init(networkService: NetworkService=NetworkService()) {
        self.networkService = networkService
    }
    
    // MARK: - 내 여행 목록 조회 API
    func fetchMyTrips() async -> NetworkResult<[TripResDto]> {
        return await networkService.request(TripEndpoint.fetchMyTrips)
    }
    
    // MARK: - 여행 생성 API
    func addTrip(body: AddTripReqDto) async -> NetworkResult<TripResDto> {
        return await networkService.request(TripEndpoint.addTrip(body: body))
    }
}
