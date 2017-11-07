//
//  CalenderViewController.swift
//  FSCalenderPoc
//
//  Created by ashok londhe on 01/11/17.
//  Copyright © 2017 ashok londhe. All rights reserved.
//

import UIKit
import FSCalendar
import EventKit

class CalenderViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance , UITableViewDelegate, UITableViewDataSource {

    let calender = FSCalendar()
    var calendercell = FSCalendarCell()
    var events = ["Birthday","Meeting","Holiday.."]
    //let eventData = [E]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calender.allowsMultipleSelection = false
        calender.delegate = self
        calender.dataSource = self
        calender.appearance.separators = .interRows
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
         if calender.isDate(inToday: date) {
            return 1
         } else {
            return events.count
        }
    }
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
       
        
        if calender.isDate(inToday: date) {
            return "Today"
        } else {
            return ""
        }
    }
    
    
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
        calender.setScope(.week, animated: true)
        return [UIColor.red, UIColor.blue, UIColor.green]
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventSelectionColorsFor date: Date) -> [UIColor]? {
        return [UIColor.red, UIColor.gray, UIColor.green]
    }
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calender.setScope(.week, animated: true)
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
        let string = dateFormatter.string(from: date) // "Tuesday, March 14, 2017"
        print(string)
        if calender.isDate(inToday: date) {
            events = ["Meeting"]
            self.tableView.delegate = self
            self.tableView.dataSource = self
        } else {
            events = ["Birthday","Meeting","Holiday.."]
            self.tableView.delegate = self
            self.tableView.dataSource = self
        }
        self.tableView.reloadData()
    }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.calendercell = cell
    
        // self.calendercell.backgroundColor = UIColor.purple
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        cell?.textLabel?.text = events[indexPath.row]
        return cell!
    }
    
    func eventForDate(date: Date) {
        
    }

}
