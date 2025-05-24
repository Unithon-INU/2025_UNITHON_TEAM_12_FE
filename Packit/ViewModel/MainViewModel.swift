//
//  MainViewModel.swift
//  Packit
//
//  Created by Bowon Han on 5/24/25.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var trip: Trip
    
    init(trip: Trip) {
        self.trip = trip
    }
    
    func fetchTripData() {
        
    }
}
