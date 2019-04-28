//
//  DryFunc+Date.swift
//  DryFunc
//
//  Created by Ruiying Duan on 2019/4/17.
//

import UIKit
import Foundation

//MARK: - 通用方法(日期)
extension DryFunc {
    
    /// @说明 获取日期格式(12小时制、yyyy MM dd hh:mm:ss)
    /// @返回 DateFormatter
    @objc
    @discardableResult
    public static func formatter12() -> DateFormatter {
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd hh:mm:ss"
        return formatter
    }
    
    /// @说明 获取日期格式(24小时制、yyyy MM dd hh:mm:ss)
    /// @返回 DateFormatter
    @objc
    @discardableResult
    public static func formatter24() -> DateFormatter {
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd HH:mm:ss"
        return formatter
    }
    
    /// @说明 获取UTC时间戳(单位: s)
    /// @参数 date:   日期
    /// @返回 Int64
    @objc
    @discardableResult
    public static func utcTimestamp(withDate date: Date) -> Int64 {
        return Int64(date.timeIntervalSince1970)
    }
    
    /// @说明 获取UTC日期
    /// @参数 timestamp:  UTC时间戳(单位: s)
    /// @返回 Date
    @objc
    @discardableResult
    public static func utcDate(withUtcTimestamp timestamp: Int64) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(timestamp))
    }
    
    /// @说明 获取本地日期(12小时制、yyyy MM dd hh:mm:ss)
    /// @参数 date:   UTC日期
    /// @返回 Date?
    @objc
    @discardableResult
    public static func localDate12(withUtcDate date: Date) -> Date? {
        
        let df = DryFunc.formatter12()
        let dateString = df.string(from: date)
        let date = df.date(from: dateString)
        return date
    }
    
    /// @说明 获取本地日期(24小时制、yyyy MM dd hh:mm:ss)
    /// @参数 date:   UTC日期
    /// @返回 Date?
    @objc
    @discardableResult
    public static func localDate24(withUtcDate date: Date) -> Date? {
        
        let df = DryFunc.formatter24()
        let dateString = df.string(from: date)
        let date = df.date(from: dateString)
        return date
    }
    
    /// @说明 获取日期中的"年"
    /// @参数 date:   日期
    /// @返回 Int
    @objc
    @discardableResult
    public static func year(withDate date: Date) -> Int {
        return Calendar.current.component(.year, from: date)
    }
    
    /// @说明 获取日期中的"月"
    /// @参数 date:   日期
    /// @返回 Int
    @objc
    @discardableResult
    public static func month(withDate date: Date) -> Int {
        return Calendar.current.component(.month, from: date)
    }
    
    /// @说明 获取日期中的"日"
    /// @参数 date:   日期
    /// @返回 Int
    @objc
    @discardableResult
    public static func day(withDate date: Date) -> Int {
        return Calendar.current.component(.day, from: date)
    }
    
    /// @说明 获取日期中的"时"
    /// @参数 date:   日期
    /// @返回 Int
    @objc
    @discardableResult
    public static func hour(withDate date: Date) -> Int {
        return Calendar.current.component(.hour, from: date)
    }
    
    /// @说明 获取日期中的"分"
    /// @参数 date:   日期
    /// @返回 Int
    @objc
    @discardableResult
    public static func minute(withDate date: Date) -> Int {
        return Calendar.current.component(.minute, from: date)
    }
    
    /// @说明 获取日期中的"秒"
    /// @参数 date:   日期
    /// @返回 Int
    @objc
    @discardableResult
    public static func second(withDate date: Date) -> Int {
        return Calendar.current.component(.second, from: date)
    }
}
