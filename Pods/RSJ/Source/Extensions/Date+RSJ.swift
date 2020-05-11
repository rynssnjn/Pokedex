//
//  Date+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import struct Foundation.TimeZone
import struct Foundation.Calendar
import struct Foundation.Date
import struct Foundation.DateComponents

public struct RSJDateSpecific {

    // MARK: Static Properties
    public static let timeZone: TimeZone = TimeZone(identifier: "UTC")!

    public static let calendar: Calendar = {
        var calendar: Calendar = Calendar.autoupdatingCurrent
        calendar.firstWeekday = 1
        calendar.timeZone = RSJDateSpecific.timeZone
        return calendar
    }()

    // MARK: Enum
    public enum Weekdays: Int {

        case sunday = 1

        case monday = 2

        case tuesday = 3

        case wednesday = 4

        case thursday = 5

        case friday = 6

        case saturday = 7
    }

    // MARK: Stored Propeties
    let date: Date

}

public extension RSJDateSpecific {

    var startOfDay: Date {
        return RSJDateSpecific.calendar.startOfDay(for: self.date)
    }

    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return RSJDateSpecific.calendar.date(byAdding: components, to: self.startOfDay)!
    }

    func date(ofPastWeekday weekday: RSJDateSpecific.Weekdays) -> Date {
        var calendar: Calendar = Calendar.autoupdatingCurrent
        calendar.firstWeekday = weekday.rawValue
        calendar.timeZone = RSJDateSpecific.timeZone

        let currentDateComponents: DateComponents = calendar.dateComponents(
            [Calendar.Component.yearForWeekOfYear, Calendar.Component.weekOfYear],
            from: self.date
        )

        return calendar.date(from: currentDateComponents)!
    }
}

public extension Date {

    var rsj: RSJDateSpecific {
        return RSJDateSpecific(date: self)
    }

}
