//
//  MyViewModel.swift
//  Packit
//
//  Created by 이예나 on 6/25/25.
//

import Foundation

@MainActor
final class MyViewModel: ObservableObject {
    @Published var myInfo = [MyInfoModel]()
    @Published var myTrip = [MyTripModel]()
    
    private let myService: MyServiceProtocol
    
    init(myService: MyServiceProtocol=MyService()) {
        self.myService = myService
    }
    
    // MARK: - 회원 정보 조회
    func fetchMyInfo() async {
        let result = await myService.fetchMyInfo()
        
        switch result {
        case .success(let data, _):
            DispatchQueue.main.async {
                self.myInfo = data.data
            }
        case .failure(let statusCode, let message):
            print("[fetchMyInfo] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
    
    // MARK: - 회원 여행 정보 요약 조회
    func fetchMyTrip() async {
        let result = await myService.fetchMyTrip()
        
        switch result {
        case .success(let data, _):
            DispatchQueue.main.async {
                self.myTrip = data.data
            }
        case .failure(let statusCode, let message):
            print("[fetchMyTrip] - [\(statusCode)]: \(message ?? "알 수 없는 오류")")
        }
    }
}
