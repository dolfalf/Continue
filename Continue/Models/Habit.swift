//
//  Habit.swift
//  Continue
//
//  Created by lee jaeeun on 2016/11/11.
//  Copyright © 2016年 lee jaeeun. All rights reserved.
//

import UIKit

class Habit: NSObject {
    var key: String?
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
        
        self.key = nil
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
    
    convenience override init() {
        self.init(title: "", detail: "", startDate: 0, token: "", notifyFlag:false, weekFlag: false)
    }
    
    func convertToDictionary() -> Dictionary<String, Any> {
        
        var dict = Dictionary<String, Any>()
        
        if (self.key != nil) {
            dict["key"] = self.key
        }
        
        dict["title"] = self.title
        dict["detail"] = self.detail
        dict["startDate"] = self.startDate
        dict["lastDoingDate"] = self.lastDoingDate
        dict["dayCount"] = self.dayCount
        dict["targetDayCount"] = self.targetDayCount
        dict["token"] = self.token
        dict["notifyFlag"] = self.notifyFlag
        dict["weekFlag"] = self.weekFlag
        dict["deleteFlag"] = self.deleteFlag
        dict["completeFlag"] = self.completeFlag
        dict["timestamp"] = self.timestamp

        return dict
    }
    
}
