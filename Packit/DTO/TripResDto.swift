//
//  TripResDto.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

struct TripResDto: Identifiable, Codable {
    let id: Int
    let title: String
    let region: String
    let tripTypes: [String]
    let startDate: String?
    let endDate: String?
    let description: String
    let isCompleted: Bool
}

// MARK: - TripResDto 유틸 확장
extension TripResDto {
    
    // 날짜 포맷터
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone.current
        return formatter
    }

    // 문자열을 Date로 변환
    var start_date: Date? {
        dateFormatter.date(from: startDate ?? "")
    }

    var end_date: Date? {
        dateFormatter.date(from: endDate ?? "")
    }

    // 현재 날짜 기준으로 여행이 끝났는지 확인
    var isBeen: Bool {
        guard let endDate = end_date else { return false }
        return Date() > endDate
    }

    // D-day 또는 월 표시
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

    // 여행 기간 계산 (몇박 몇일)
    var durationText: String {
        guard let startDate = start_date, let endDate = end_date else {
            return "기간 정보 없음"
        }

        let calendar = Calendar.current

        // 날짜만 추출
        let start = calendar.startOfDay(for: startDate)
        let end = calendar.startOfDay(for: endDate)
        print(start, end)

        if let days = calendar.dateComponents([.day], from: start, to: end).day {
            if days == 0 {
                return "당일 치기 일정"
            } else {
                return "\(days)박 \(days + 1)일 일정"
            }
        }

        return "기간 정보 없음"
    }
}
