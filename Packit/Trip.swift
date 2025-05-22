//
//  Trip.swift
//  Packit
//
//  Created by Bowon Han on 5/22/25.
//

struct Trip: Identifiable, Codable {
    var trip_id: Int
    var title: String
    var location: String
    var start_date: String
    var end_date: String
    var created_at: String
    var travel_type: String
    var companions: Int
    var companions_type: String
    var user_id: Int
    
    var id: Int { trip_id }
}
