//
//  PlanPackitFomeViewModel.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

final class PlanPackitFormViewModel: ObservableObject {
    private let tripService: TripServiceProtocol
    
    @Published var reqBody = AddTripReqDto(title: "", region: "", tripType: "", startDate: "", endDate: "", description: "")
    @Published var result = TripResDto(id: 0, title: "", region: "", tripType: "", startDate: "", endDate: "", description: "", isCompleted: true)
    
    init(tripService: TripServiceProtocol=TripService()) {
        self.tripService = tripService
    }
    
    func addTrip() async {
        let result = await tripService.addTrip(body: reqBody)
        
        switch result {
        case .success(let data, _):
            print(data)
            self.result = data.data
        case .failure(let statusCode, let message):
            print("[addTripItem] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
}
