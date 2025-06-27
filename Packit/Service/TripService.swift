//
//  TripServoce.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

protocol TripServiceProtocol {
    // MARK: - 내 여행 목록 조회 API
    func fetchMyTrips() async -> NetworkResult<APIResDto<[TripResDto]>>
    
    // MARK: - 여행 생성 API
    func addTrip(body: AddTripReqDto) async -> NetworkResult<APIResDto<TripResDto>>
    
    // MARK: - 여행 짐싸기 진행률 API
    func fetchTripProgress(tripId: Int) async  -> NetworkResult<APIResDto<TripProgressResDto>>
    
    // MARK: - 다가오는 여정 API
    func fetchUpcomingTrip() async -> NetworkResult<APIResDto<TripNeareastModel>>
}

final class TripService: TripServiceProtocol {
    private let networkService: NetworkService
    
    init(networkService: NetworkService=NetworkService()) {
        self.networkService = networkService
    }
    
    // MARK: - 내 여행 목록 조회 API
    func fetchMyTrips() async -> NetworkResult<APIResDto<[TripResDto]>> {
        return await networkService.request(TripEndpoint.fetchMyTrips)
    }
    
    // MARK: - 여행 생성 API
    func addTrip(body: AddTripReqDto) async -> NetworkResult<APIResDto<TripResDto>> {
        return await networkService.request(TripEndpoint.addTrip(body: body))
    }
    
    // MARK: - 여행 짐싸기 진행률 API
    func fetchTripProgress(tripId: Int) async -> NetworkResult<APIResDto<TripProgressResDto>> {
        return await networkService.request(TripEndpoint.fetchTripProgress(tripId: tripId))
    }
    
    // MARK: - 다가오는 여정 API
    func fetchUpcomingTrip() async -> NetworkResult<APIResDto<TripNeareastModel>> {
        return await networkService.request(TripEndpoint.fetchUpcomingTrip)
    }
}
