//
//  MainViewModel.swift
//  Packit
//
//  Created by Bowon Han on 5/24/25.
//

import Foundation

@MainActor
final class MainViewModel: ObservableObject {
    @Published var tripList = [TripResDto]()
    @Published var firstTrip: TripResDto?
    @Published var tripProgressRate: Float?
    
    private let tripService: TripServiceProtocol
    
    init(tripService: TripServiceProtocol=TripService()) {
        self.tripService = tripService
    }
    
    // MARK: - 내 여행 목록 조회
    func fetchMyTrips() async {
        let result = await tripService.fetchMyTrips()
        
        switch result {
        case .success(let data, _):
            self.tripList = data.data
            self.firstTrip = data.data.first
        case .failure(let statusCode, let message):
            print("[fetchMyTrips] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    func fetchTripProgress(tripId: Int) async {
        let result = await tripService.fetchTripProgress(tripId: tripId)
        
        switch result {
        case .success(let data, _):
            DispatchQueue.main.async {
                print(data.data)
                self.tripProgressRate = data.data.progressRate
            }
        case .failure(let statusCode, let message):
            print("[fetchTripProgress] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
}
