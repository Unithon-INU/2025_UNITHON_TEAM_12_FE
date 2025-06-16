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
    
    private let tripService: TripServiceProtocol
    
    init(tripService: TripServiceProtocol=TripService()) {
        self.tripService = tripService
    }
    
    // MARK: - 내 여행 목록 조회
    func fetchMyTrips() async {
        let result = await tripService.fetchMyTrips()
        
        switch result {
        case .success(let data, _):
            DispatchQueue.main.async {
                self.tripList = data
            }
        case .failure(let statusCode, let message):
            print("[fetchMyTrips] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
}
