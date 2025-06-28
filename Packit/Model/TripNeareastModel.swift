//
//  TripNeareastModel.swift
//  Packit
//
//  Created by Bowon Han on 6/27/25.
//

import Foundation

struct TripNeareastModel: Codable {
    let tripId: Int
    let title: String
    let region: String
    let description: String
    let startDate: String
    let endDate: String
    let tripTypes: [String]
    let progressRate: Double
}

extension TripNeareastModel {
    
    // 날짜 포맷터
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone.current
        return formatter
    }

    var start_date: Date? {
        dateFormatter.date(from: startDate)
    }

    var end_date: Date? {
        dateFormatter.date(from: endDate)
    }

    var isBeen: Bool {
        guard let endDate = end_date else { return false }
        return Date() > endDate
    }

    var periodText: String {
        guard let startDate = start_date else { return "날짜 오류" }

        if isBeen {
            let calendar = Calendar.current
            let month = calendar.component(.month, from: startDate)
            return "\(month)월"
        } else {
            let calendar = Calendar.current
            let today = Date()
            let components = calendar.dateComponents([.day], from: today, to: startDate)

            if let days = components.day {
                if days == 0 {
                    return "D-Day"
                } else if days > 0 {
                    return "D-\(days)"
                } else {
                    return "진행 중"
                }
            }
            return "D-Day"
        }
    }

    var durationText: String {
        guard let startDate = start_date, let endDate = end_date else {
            return "기간 정보 없음"
        }

        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)

        if let days = components.day {
            if days == 0 {
                return "당일 치기 일정"
            } else {
                return "\(days)박 \(days + 1)일 일정"
            }
        }
        return "기간 정보 없음"
    }
}
