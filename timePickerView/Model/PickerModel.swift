//
//  Model.swift
//  timePickerView
//
//  Created by Амир Гезаль on 28.01.2020.
//  Copyright © 2020 Амир Гезаль. All rights reserved.
//

import UIKit
struct PickerModel {
    //constants
    struct Constants {
        struct HowMany {
            static var days   = 0
            static var weeks  = 0
            static var months = 0
        }
    }
    //variables
    struct Components {
        static var first  = 0
        static var second = 0
        static var third  = 0
    }
    //Intervals
    struct Intervals {
        static var currentDate   = Date()
        static var futureDate    : Date?
        static var dateComponent = DateComponents()
        static var interval      : NSDateInterval?
    }
    //picker methods
    struct Picker {
        //set content from K.File
        static func pickerContent(titleForRow row: Int, forComponent component: Int) -> String {
            if component == 0 {
                return K.pickerData.firstComponent[row]
            }
            if component == 1 {
                for _ in 0..<K.pickerData.secondComponent.count {
                    return K.pickerData.secondComponent[row]
                }
            }
            if component == 2 {
                for _ in 0..<K.pickerData.thirdComponent.count {
                    return K.pickerData.thirdComponent[row]
                }
            }
            return ""
        }
        //set rowws
        static func returnRows(_ component: Int) -> Int {
            switch component {
            case 0:
                return 1
            case 1:
                return 12
            case 2:
                return 3
            default:
                return 0
            }
        }
        //update components when called
        static func didSelect(_ row: Int, _ component: Int) {
            switch component {
            case 0:
                PickerModel.Components.first = row
            case 1:
                PickerModel.Components.second = row
            case 2:
                PickerModel.Components.third = row
            default:
                break
            }
        }
    }
    //button methods
    struct Buttons {
        //Hide view
        static func back(_ viewToHide: UIStackView) {
            viewToHide.isHidden = true 
        }
        //get the pickerData
        static func done() -> (NSDateInterval?,Date?){
            setInterval()
            return (Intervals.interval,Intervals.futureDate)
        }
        //sets days/weeks/months number of what user choose and calls giveInterval method
        static func setInterval() {
            switch Components.third {
            case 0: Constants.HowMany.days = Components.second + 1; giveInterval(0)
            case 1: Constants.HowMany.weeks = Components.second + 1; giveInterval(1)
            case 2: Constants.HowMany.months = Components.second + 1; giveInterval(2)
            default:
                break
            }
        }
        //set all the intervals
        static func giveInterval(_ DWM: Int) {
            switch DWM {
            case 0: Intervals.dateComponent.day = Constants.HowMany.days;
            Intervals.futureDate = Calendar.current.date(byAdding: Intervals.dateComponent, to: Intervals.currentDate); //sets future date
            Intervals.interval = NSDateInterval(start: Intervals.currentDate, end: Intervals.futureDate!) //sets interval
            case 1: Intervals.dateComponent.day = Constants.HowMany.weeks * 7;
            Intervals.futureDate = Calendar.current.date(byAdding: Intervals.dateComponent, to: Intervals.currentDate)
            Intervals.interval = NSDateInterval(start: Intervals.currentDate, end: Intervals.futureDate!)
            case 2: Intervals.dateComponent.month = Constants.HowMany.months;
            Intervals.futureDate = Calendar.current.date(byAdding: Intervals.dateComponent, to: Intervals.currentDate)
            Intervals.interval = NSDateInterval(start: Intervals.currentDate, end: Intervals.futureDate!)
            default:
                break
            }
        }
    }
}
