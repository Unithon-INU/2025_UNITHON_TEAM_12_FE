//
//  CalendarView.swift
//  Packit
//
//  Created by Bowon Han on 5/29/25.
//

import SwiftUI

struct CalendarView: View {
    let currentMonth = Date() // 현재 날짜
    let calendar = Calendar.current
    
    @State var selectedDate: Date = Date.now
    
    private func monthDateRange() -> Range<Date> {
        let monthInterval = calendar.dateInterval(of: .month, for: currentMonth)! // 현재 날짜의 월
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
                ForEach(week, id: \.self) { week in
                    Text(week)
                        .font(.custom("Pretendard", size: 15))
                        .fontWeight(.regular)
                        .foregroundStyle(week=="일" ? .red : .black)
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
                        if calendar.isDate(date, equalTo: selectedDate, toGranularity: .day) {
                            Circle()
                                .foregroundStyle(Color.packitLightPurple)
                        }
                        
                        Text("\(calendar.component(.day, from: date))")
                            .font(.custom("Pretendard", size: 13))
                            .fontWeight(.semibold)
                            .padding(.vertical)
                            .onTapGesture {
                                selectedDate = date
                                print(date)
                            }
                    }
                }
            }
        }
    }
}
