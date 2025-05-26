//
//  MainViewModel.swift
//  Packit
//
//  Created by Bowon Han on 5/24/25.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var tripList = [Trip]()
    
    init() {
        fetchTripData()
    }
    
    func fetchTripData() {
        if let trip: [Trip] = JSONParser.parse(fileName: "Trip") {
            self.tripList = trip
        } else {
            print("JSON DECODE 에러입니다.")
        }
    }
}
