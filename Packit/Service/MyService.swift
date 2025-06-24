//
//  MyService.swift
//  Packit
//
//  Created by 이예나 on 6/25/25.
//

import Foundation

protocol MyServiceProtocol {
    // MARK: - 회원 정보 조회 API
    func fetchMyInfo() async -> NetworkResult<APIResDto<[MyInfoModel]>>
    
    // MARK: - 회원 여행 정보 요약 API
    func fetchMyTrip() async -> NetworkResult<APIResDto<[MyTripModel]>>
}

final class MyService: MyServiceProtocol {
    private let networkService: NetworkService
    
    init(networkService: NetworkService=NetworkService()) {
        self.networkService = networkService
    }
    
    // MARK: - 내 여행 목록 조회 API
    func fetchMyInfo() async -> NetworkResult<APIResDto<[MyInfoModel]>> {
        return await networkService.request(MyEndpoint.fetchMyInfo)
    }
    
    // MARK: - 여행 생성 API

    func fetchMyTrip() async -> NetworkResult<APIResDto<[MyTripModel]>> {
        return await networkService.request(MyEndpoint.fetchMyTrip)
    }
}
