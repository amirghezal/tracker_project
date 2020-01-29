//
//  WeeklyModel.swift
//  timePickerView
//
//  Created by Амир Гезаль on 28.01.2020.
//  Copyright © 2020 Амир Гезаль. All rights reserved.
//

import UIKit
struct WeeklyModel {
    //Variables
    struct Variables {
        //array of days by their index in the week. sunday = 0 mondey = 2 
        static var arrayOfDays = [Int]()
    }
    //Buttons methods and properties
    struct Buttons {
        static let color = UIColor.lightGray
        //whenever day button pressed
        static func choose(_ sender: UIButton) {
            if sender.backgroundColor !=  Buttons.color {
                sender.backgroundColor = Buttons.color
            } else {
                sender.backgroundColor = UIColor.clear
            }
        }
        //when back pressed
        static func back() {
            //
        }
        //when done pressed
        static func done(_ array: [UIButton]) {
            Variables.arrayOfDays = []
            for i in 0...6 {
                if array[i].backgroundColor == Buttons.color {
                    Variables.arrayOfDays.append(i)
                }
            }
        }
    }
}
