//
//  FSCalenderSubclass.swift
//  FSCalenderPoc
//
//  Created by ashok londhe on 07/11/17.
//  Copyright © 2017 ashok londhe. All rights reserved.
//

import UIKit
import FSCalendar

class FSCalenderSubclass: FSCalendar {

    override func cell(for date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell? {
        let cell = FSCalendarCell()
        return cell
    }

}
