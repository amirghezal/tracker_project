//
//  ViewController.swift
//  timePickerView
//
//  Created by Амир Гезаль on 28.01.2020.
//  Copyright © 2020 Амир Гезаль. All rights reserved.
//

import UIKit
import CalendarView
import SwiftMoment


class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var currentMoment: Moment?
    var arrayofdate = [Moment]()
    @IBAction func kekpressed(_ sender: UIButton) {
        var isMatched = false
        var index : Int?
        
        if let i = MonthModel.checkForMatch(&isMatched, &index, arrayofdate, currentMoment) {
            arrayofdate.remove(at: i)
            label.text = "removed \(currentMoment!.format("MMMM d"))"
        } else {
            arrayofdate.append(currentMoment!)
            label.text = "added \(currentMoment!.format("MMMM d"))"
        }
    }
    
    
    @IBOutlet weak var Viewkek: UIView!
    @IBOutlet weak var kek: UIButton!
    @IBOutlet weak var calendar: CalendarView!
    
    
    
    
    
    
    
    
    
    
    
    //MainView
    @IBOutlet weak var IntervalChoser: UIStackView!
    
    //IntervalsView
    @IBOutlet weak var IntervalsStackView: UIStackView!
    
    //WeeklyPickerView outlets
    @IBOutlet weak var WeeklyPickerView: UIStackView!
    @IBOutlet var WeeklyCollection: [UIButton]!
    
    //CustomPickerView outlets
    @IBOutlet weak var customPickerView: UIStackView!
    @IBOutlet weak var customIntervalPicker: UIPickerView!
    
    //VC lifeCicle
    //ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        customIntervalPicker.dataSource = self
        customIntervalPicker.delegate   = self
        calendar.delegate = self
        //hides AllViews
        customPickerView.isHidden = true
        WeeklyPickerView.isHidden = true
        IntervalsStackView.isHidden = true
        Viewkek.isHidden = true
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { (timer) in
            for i in self.arrayofdate {
                print(i.format("MMMM d"))
            }
        }
    }
    
    //IntervalChoser
    @IBAction func choser(_ sender: UIButton) {
        K.changeView(IntervalChoser, IntervalsStackView)
    }
    
    //Inrevals
    @IBAction func DaySetter(_ sender: UIButton) {
        //show your already working view
        
    }
    @IBAction func WeekSetter(_ sender: UIButton) {
        K.changeView(IntervalsStackView, WeeklyPickerView)
        
    }
    
    @IBAction func MonthSetter(_ sender: UIButton) {
        IntervalsStackView.isHidden = true
        Viewkek.isHidden = false
    }
    @IBAction func CustomSetter(_ sender: UIButton) {
        K.changeView(IntervalsStackView, customPickerView)
    }
    @IBAction func BackButton(_ sender: UIButton) {
        K.changeView(IntervalsStackView, IntervalChoser)
    }
    @IBAction func Donebutton(_ sender: UIButton) {
        K.changeView(IntervalsStackView, IntervalChoser)
    }
    
    
    //WeeklyPickerViewButtons
    @IBAction func WeekDaySelected(_ sender: UIButton) {
        WeeklyModel.Buttons.choose(sender)
    }
    @IBAction func WBackButtonPressed(_ sender: UIButton) {
        //hides the view
        K.changeView(WeeklyPickerView, IntervalsStackView)
    }
    @IBAction func WDoneButtonPressed(_ sender: UIButton) {
        //prints the array of chosen elements
        WeeklyModel.Buttons.done(WeeklyCollection)
        K.changeView(WeeklyPickerView, IntervalsStackView)
    }
    
    
    //CustomPickerViewButtons
    @IBAction func backButtonPressed(_ sender: UIButton) {
        //hides the view
        //PickerModel.Buttons.back(customPickerView)
        K.changeView(customPickerView, IntervalsStackView)
    }
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        //returns (NSDateInterval?,Date?)
        //NSDateInterval of choosen interval
        //Date - now + interval
        PickerModel.Buttons.done()
        K.changeView(customPickerView, IntervalsStackView)
    }
}


//UIPickerDataSourse and Delegate
extension ViewController : UIPickerViewDataSource {
    //Components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    //ReturnRowws for component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        PickerModel.Picker.returnRows(component)
    }
}
extension ViewController : UIPickerViewDelegate {
    //set content from K.Picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        PickerModel.Picker.pickerContent(titleForRow: row, forComponent: component)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        PickerModel.Picker.didSelect(row, component)
    }
}

extension ViewController: CalendarViewDelegate {
    func calendarDidSelectDate(date: Moment) {
        self.currentMoment = date
    }
    
    func calendarDidPageToDate(date: Moment) {
        
    }
    
    
}
