//
//  K.swift
//  timePickerView
//
//  Created by Амир Гезаль on 28.01.2020.
//  Copyright © 2020 Амир Гезаль. All rights reserved.
//

import UIKit
struct K {
    struct pickerData {
        static let firstComponent   = ["Every"]
        static let secondComponent  = ["1","2","3","4","5","6","7","8","9","10","11","12"]
        static let thirdComponent   = ["Day","Week","Month"]
    }
    static func changeView(_ hide: UIView,_ show: UIView) {
        hide.isHidden = true
        show.isHidden = false
    }
}
