//
//  Trip.swift
//  Packit
//
//  Created by Bowon Han on 5/22/25.
//
import Foundation

struct Trip: Identifiable, Codable {
    var trip_id: Int
    var title: String
    var location: String
    var start_date: String
    var end_date: String
    var created_at: String
    var travel_type: String
    var companions: Int
    var companion_type: String
    var user_id: Int
    
    var id: Int { trip_id }
}

// Trip 모델을 위한 확장 - UI에 필요한 계산된 속성들
extension Trip {
    // 날짜 포맷터
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter
    }
    
    // start_date를 Date로 변환
    var startDate: Date? {
        dateFormatter.date(from: start_date)
    }
    
    // end_date를 Date로 변환
    var endDate: Date? {
        dateFormatter.date(from: end_date)
    }
    
    // 현재 날짜 기준으로 여행이 끝났는지 확인
    var isBeen: Bool {
        guard let endDate = endDate else { return false }
        return Date() > endDate
    }
    
    // D-day 또는 월 표시
    var periodText: String {
        guard let startDate = startDate else { return "날짜 오류" }
        
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
    
    // 여행 기간 계산 (몇박 몇일)
    var durationText: String {
        guard let startDate = startDate, let endDate = endDate else {
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
