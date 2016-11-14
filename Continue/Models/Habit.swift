//
//  Habit.swift
//  Continue
//
//  Created by lee jaeeun on 2016/11/11.
//  Copyright © 2016年 lee jaeeun. All rights reserved.
//

import UIKit

class Habit: NSObject {
    var habitNo: Double
    var title: String
    var detail: String
    var startDate: UInt64
    var lastDoingDate: UInt64
    var dayCount: UInt16
    var targetDayCount: UInt16
    var token: String
    var notifyFlag: Bool
    var weekFlag: Bool
    var completeFlag: Bool
    var deleteFlag: Bool
    var timestamp: UInt64
    
    init(title: String, detail: String, startDate: UInt64
        ,token: String,notifyFlag: Bool,weekFlag: Bool) {
        
        self.habitNo = 0    //increse
        self.title = title
        self.detail = detail
        self.startDate = startDate
        self.lastDoingDate = 0
        self.dayCount = 0
        self.targetDayCount = 66    //default 66days
        self.token = token
        self.notifyFlag = notifyFlag
        self.weekFlag = weekFlag
        self.completeFlag = false
        self.deleteFlag = false
        self.timestamp = UInt64(NSDate().timeIntervalSince1970)
        
    }
    
}
