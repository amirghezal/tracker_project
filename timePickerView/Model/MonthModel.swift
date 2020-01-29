//
//  File.swift
//  timePickerView
//
//  Created by Амир Гезаль on 29.01.2020.
//  Copyright © 2020 Амир Гезаль. All rights reserved.
//

import CalendarView
import SwiftMoment
struct MonthModel {
    static func checkForMatch(_ status: inout Bool,_ indexAt: inout Int?, _ arrayToCheck: [Moment],_ currentMoment: Moment?) -> Int? {
        indexAt = nil
        for i in 0..<arrayToCheck.count {
            if currentMoment == arrayToCheck[i] {
                status = true
                indexAt = i
            }
        }
        return indexAt 
    }
}
