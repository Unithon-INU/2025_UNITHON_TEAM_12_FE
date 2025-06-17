//
//  TravelListViewModel.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

final class TravelListViewModel: ObservableObject {
    private let tripService: TripServiceProtocol
    
    @Published var tripList = [TripResDto]()
    
    init(tripService: TripServiceProtocol=TripService()) {
        self.tripService = tripService
        Task{
          await fetchTripList()
        }
    }
    
    var upcomingTrips: [TripResDto] {
        tripList.filter { !$0.isBeen }
    }
    
    var pastTrips: [TripResDto] {
        tripList.filter { $0.isBeen }
    }
    
    // MARK: - 여행 목록 조회 API
    func fetchTripList() async {
        let result = await tripService.fetchMyTrips()
        
        switch result {
        case .success(let data, _):
            self.tripList = data.data
        case .failure(let statusCode, let message):
            print("[fetchTripList] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
}
