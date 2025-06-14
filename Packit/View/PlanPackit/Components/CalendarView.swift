//
//  CalendarView.swift
//  Packit
//
//  Created by Bowon Han on 5/29/25.
//

import SwiftUI

struct CalendarView: View {
    let currentMonth = Date()
    let calendar = Calendar(identifier: .gregorian)
    
    @State private var stardDate: Date? = nil
    @State private var endDate: Date? = nil
    
    private func monthDateRange() -> Range<Date> {
        let monthInterval = calendar.dateInterval(of: .month, for: currentMonth)!
        return monthInterval.start..<calendar.date(byAdding: .month, value: 1, to: monthInterval.start)!
    }
    
    private func generateDates(for dateRange: Range<Date>, calendar: Calendar) -> [Date] {
        var dates: [Date] = []
        var currentDate = dateRange.lowerBound
        while currentDate < dateRange.upperBound {
            dates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        return dates
    }
    
    var body: some View {
        let dateRange = monthDateRange()
        let dates = generateDates(for: dateRange, calendar: calendar)
        let week = ["일", "월", "화", "수", "목", "금", "토"]

        VStack(alignment: .leading) {
            HStack(spacing: 33.3) {
                ForEach(week, id: \.self) { day in
                    Text(day)
                        .font(.custom("Pretendard", size: 15))
                        .fontWeight(.regular)
                        .foregroundStyle(day == "일" ? .red : .black)
                }
            }
            .padding(.leading, 13)
            .padding(.bottom, 20)
            
            Text("\(String(calendar.component(.year, from: dates.first ?? Date.now)))년 \(String(calendar.component(.month, from: dates.first ?? Date.now)))월")
                .font(.custom("Pretendard", size: 16))
                .padding(.leading, 12)
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(dates, id: \.self) { date in
                    ZStack {
                        let isStart = calendar.isDate(date, equalTo: stardDate ?? Date.distantPast, toGranularity: .day)
                        let isEnd = calendar.isDate(date, equalTo: endDate ?? Date.distantPast, toGranularity: .day)
                        let isBetween = {
                            if let start = stardDate, let end = endDate {
                                return (start...end).contains(date)
                            }
                            return false
                        }()
                        
                        if isStart || isEnd {
                            Text("\(calendar.component(.day, from: date))")
                                .font(.custom("Pretendard", size: 13))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.white)
                                .frame(width: 34, height: 33)
                                .padding(.vertical, 10)
                                .background(
                                    Circle()
                                        .foregroundStyle(Color.packitPurple)
                                )
                        }
                        
                        else if isBetween {
                            Text("\(calendar.component(.day, from: date))")
                                .font(.custom("Pretendard", size: 13))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .frame(width: 34, height: 33)
                                .padding(.vertical, 10)
                                .background(
                                    Circle()
                                        .foregroundStyle(Color.packitLightPurple)
                                )
                        }
                        
                        else {
                            Text("\(calendar.component(.day, from: date))")
                                .font(.custom("Pretendard", size: 13))
                                .frame(width: 34, height: 33)
                                .fontWeight(.semibold)
                                .padding(.vertical, 10)
                        }
                    }
                    .onTapGesture {
                        if stardDate == nil && endDate == nil {
                            stardDate = date
                        } else if stardDate != nil && endDate == nil {
                            endDate = date
                            if let start = stardDate, let end = endDate, start > end {
                                stardDate = end
                                endDate = start
                            }
                        } else {
                            stardDate = date
                            endDate = nil
                        }
                    }
                }
            }
        }
    }
}
