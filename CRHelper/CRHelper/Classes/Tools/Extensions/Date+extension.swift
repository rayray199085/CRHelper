//
//  Date+extension.swift
//  MySinaWeibo
//
//  Created by Stephen Cao on 10/4/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation
private let dateformatter = DateFormatter()
private let calendar = Calendar.current
extension Date{
    /// according to current time, return a string for current time - expiry length
    /// for checking whether it is expired or not
    /// - Parameter recordTime: a expiry time length
    /// - Returns: return the time for deleting records before it
    static func getExpiredRecordsDateString(expiryLength: TimeInterval)->String{
        let recordsHasExpiredDate = Date(timeIntervalSinceNow: expiryLength)
        dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateformatter.string(from: recordsHasExpiredDate)
    }
    
    
    /// transform sina type date to normal date string
    ///
    /// - Parameter timeString: sina type date string
    /// - Returns: Date
    static func sinaDateWithString(timeString: String)->Date?{
        dateformatter.dateFormat = "EEE MMM dd HH:mm:ss zzz yyyy"
        let date = dateformatter.date(from: timeString)
        return date
    }
    /**
     Just now (in a minute)
     xx mins ago (in an hour)
     xx hrs ago (in today)
     HH:mm yesterday (yesterday)
     MM:dd HH:mm (in a year)
     yyyy-MM-dd HH:mm:ss (over a year)
     */
    var sinaDateStringDescription : String{

        if calendar.isDateInToday(self){
            let timeInterval = -Int(timeIntervalSinceNow)
            if timeInterval < 60{
                return "Just now"
            }else if timeInterval < 3600{
                return "\(timeInterval/60) mins"
            }
            return  "\(timeInterval/3600) hrs"
        }
        let createdAtYear = calendar.component(Calendar.Component.year, from: self)
        let currentYear = calendar.component(Calendar.Component.year, from: Date())
        if createdAtYear == currentYear{
            dateformatter.dateFormat = "MMMM dd 'at' h:mm a"
        }else{
             dateformatter.dateFormat = "MMMM dd, yyyy"
        }
        return dateformatter.string(from: self)
    }
}
