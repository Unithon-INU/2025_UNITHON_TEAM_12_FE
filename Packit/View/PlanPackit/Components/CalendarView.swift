//
//  CalendarView.swift
//  Packit
//
//  Created by Bowon Han on 5/29/25.
//

import SwiftUI

struct CalendarView: View {
    let calendar = Calendar(identifier: .gregorian)
    let monthOffset: Int
    @Binding var startDate: Date?
    @Binding var endDate: Date?

    private var currentMonth: Date {
        calendar.date(byAdding: .month, value: monthOffset, to: Date()) ?? Date()
    }

    private func monthDateRange() -> Range<Date> {
        let monthInterval = calendar.dateInterval(of: .month, for: currentMonth)!
        return monthInterval.start..<calendar.date(byAdding: .month, value: 1, to: monthInterval.start)!
    }
    
    private func generateDates(for dateRange: Range<Date>, calendar: Calendar) -> [Date?] {
        var dates: [Date?] = []

        let firstDate = dateRange.lowerBound
        let weekday = calendar.component(.weekday, from: firstDate)

        let leadingEmptyCount = weekday - calendar.firstWeekday
        let offset = leadingEmptyCount < 0 ? leadingEmptyCount + 7 : leadingEmptyCount
        dates.append(contentsOf: Array(repeating: nil, count: offset))

        var currentDate = firstDate
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
            Text("\(String(calendar.component(.year, from: currentMonth)))년 \(String(calendar.component(.month, from: currentMonth)))월")
                .font(.custom("Pretendard-SemiBold", size: 16))
                .padding(.bottom, 12)
                .padding(.leading, 12)

            HStack(spacing: 29) {
                ForEach(week, id: \.self) { day in
                    Text(day)
                        .font(.custom("Pretendard-Regular", size: 15))
                        .foregroundStyle(day == "일" ? .red : .black)
                }
            }
            .padding(.leading, 13)
            .padding(.bottom, 10)
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(dates.indices, id: \.self) { index in
                    if let date = dates[index] {
                        ZStack {
                            let isStart = calendar.isDate(date, equalTo: startDate ?? .distantPast, toGranularity: .day)
                            let isEnd = calendar.isDate(date, equalTo: endDate ?? .distantPast, toGranularity: .day)
                            let isBetween: Bool = {
                                if let start = startDate, let end = endDate {
                                    return date > start && date < end
                                }
                                return false
                            }()

                            if isStart || isEnd {
                                Text("\(calendar.component(.day, from: date))")
                                    .font(.custom("Pretendard-SemiBold", size: 13))
                                    .foregroundStyle(.white)
                                    .frame(width: 34, height: 33)
                                    .padding(.vertical, 10)
                                    .background(Circle().foregroundStyle(Color.packitPurple))
                            } else if isBetween {
                                Text("\(calendar.component(.day, from: date))")
                                    .font(.custom("Pretendard-SemiBold", size: 13))
                                    .foregroundStyle(.black)
                                    .frame(width: 34, height: 33)
                                    .padding(.vertical, 10)
                                    .background(Circle().foregroundStyle(Color.packitLightPurple))
                            } else {
                                Text("\(calendar.component(.day, from: date))")
                                    .font(.custom("Pretendard-SemiBold", size: 13))
                                    .frame(width: 34, height: 33)
                                    .padding(.vertical, 10)
                            }
                        }
                        .onTapGesture {
                            if startDate == nil && endDate == nil {
                                startDate = date
                            } else if startDate != nil && endDate == nil {
                                if calendar.isDate(date, inSameDayAs: startDate!) {
                                    startDate = nil
                                } else {
                                    endDate = date
                                    if let start = startDate, let end = endDate, start > end {
                                        startDate = end
                                        endDate = start
                                    }
                                }
                            } else {
                                startDate = date
                                endDate = nil
                            }
                        }
                    } else {
                        Text("")
                            .frame(width: 34, height: 33)
                            .padding(.vertical, 10)
                    }
                }
            }
        }
        .padding()
    }
}


struct ScrollableCalendarView: View {
    @Binding var startDate: Date?
    @Binding var endDate: Date?
    @State private var currentPage = 100

    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(0..<200, id: \.self) { offset in
                CalendarView(
                    monthOffset: offset - 100,
                    startDate: $startDate,
                    endDate: $endDate
                )
                .tag(offset)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
