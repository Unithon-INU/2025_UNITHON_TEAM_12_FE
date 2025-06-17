//
//  ViewModel.swift
//  Packit
//
//  Created by Bowon Han on 5/25/25.
//

import Foundation

final class PackingListCellViewModel: ObservableObject {
    @Published var trip: TripResDto
    
    init(trip: TripResDto) {
        self.trip = trip
    }
    
    
}
