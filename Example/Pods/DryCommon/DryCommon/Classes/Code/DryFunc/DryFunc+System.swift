//
//  DryFunc+System.swift
//  DryFunc
//
//  Created by Ruiying Duan on 2019/4/17.
//

import UIKit
import Foundation
import CommonCrypto
import CoreGraphics

//MARK: - 通用方法(系统)
extension DryFunc {
    
    /// @说明 应用程序唯一标识
    /// @返回 String
    @objc
    @discardableResult
    public static func bundleIdentifier() -> String {
        
        guard let bundleId = Bundle.main.bundleIdentifier else {
            return ""
        }
        
        return bundleId
    }
    
    /// @说明 系统版本(如: 10.0、11.0)
    /// @返回 String
    @objc
    @discardableResult
    public static func systemVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    /// @说明 应用程序版本(如: 1.0.0、1.0.1)
    /// @返回 String
    @objc
    @discardableResult
    public static func applicationVersion() -> String {
        
        guard let infoDict = Bundle.main.infoDictionary else {
            return ""
        }
        
        let aKey: String = "CFBundleShortVersionString"
        guard let _ = infoDict.index(forKey: aKey) else {
            return ""
        }
        
        return infoDict[aKey] as! String
    }
    
    /// @说明 设备型号(如: iPhone X)
    /// @返回 String
    @objc
    @discardableResult
    public static func devicePlatform() -> String {
        
        /// 获取platform
        var size = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0, count: size)
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        let platform: String = String(cString: machine)
        var deviceMode: String = ""
        switch platform {
            
        /// iPhone
        case "iPhone1,1": deviceMode = "iPhone 1"
        case "iPhone1,2": deviceMode = "iPhone 3"
        case "iPhone2,1": deviceMode = "iPhone 3GS"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3": deviceMode = "iPhone 4"
        case "iPhone4,1": deviceMode = "iPhone 4s"
        case "iPhone5,1", "iPhone5,2": deviceMode = "iPhone 5"
        case "iPhone5,3", "iPhone5,4": deviceMode = "iPhone 5C"
        case "iPhone6,1", "iPhone6,2": deviceMode = "iPhone 5S"
        case "iPhone7,2": deviceMode = "iPhone6"
        case "iPhone7,1": deviceMode = "iPhone6Plus"
        case "iPhone8,1": deviceMode = "iPhone6s"
        case "iPhone8,2": deviceMode = "iPhone6sPlus"
        case "iPhone8,3", "iPhone8,4": deviceMode = "iPhoneSE"
        case "iPhone9,1", "iPhone9,3": deviceMode = "iPhone7"
        case "iPhone9,2", "iPhone9,4": deviceMode = "iPhone 7 Plus"
        case "iPhone10,1", "iPhone10,4": deviceMode = "iPhone 8"
        case "iPhone10,2", "iPhone10,5": deviceMode = "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6": deviceMode = "iPhone X"
        case "iPhone11,8": deviceMode = "iPhone XR"
        case "iPhone11,2": deviceMode = "iPhone XS"
        case "iPhone11,4", "iPhone11,6": deviceMode = "iPhone XS Max"
            
        /// iPod Touch
        case "iPod1,1": deviceMode = "iPod Touch"
        case "iPod2,1": deviceMode = "iPod Touch 2"
        case "iPod3,1": deviceMode = "iPod Touch 3"
        case "iPod4,1": deviceMode = "iPod Touch 4"
        case "iPod5,1": deviceMode = "iPod Touch 5"
            
        /// iPad
        case "iPad1,1": deviceMode = "iPad"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": deviceMode = "iPad 2"
        case "iPad2,5", "iPad2,6", "iPad2,7": deviceMode = "iPad Mini 1"
        case "iPad3,1", "iPad3,2", "iPad3,3": deviceMode = "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6": deviceMode = "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3": deviceMode = "iPad air"
        case "iPad4,4", "iPad4,5", "iPad4,6": deviceMode = "iPad mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9": deviceMode = "iPad mini 3"
        case "iPad5,3", "iPad5,4": deviceMode = "iPad air 2"
        case "iPad6,3", "iPad6,4": deviceMode = "iPad Pro 9.7"
        case "iPad6,7", "iPad6,8": deviceMode = "iPad Pro 12.9"
        case "iPad6,11": deviceMode = "iPad 5 (WiFi)"
        case "iPad6,12": deviceMode = "iPad 5 (Cellular)"
        case "iPad7,1": deviceMode = "iPad Pro 12.9 inch 2nd gen (WiFi)"
        case "iPad7,2": deviceMode = "iPad Pro 12.9 inch 2nd gen (Cellular)"
        case "iPad7,3": deviceMode = "iPad Pro 10.5 inch (WiFi)"
        case "iPad7,4": deviceMode = "iPad Pro 10.5 inch (Cellular)"
            
        /// 模拟器
        case "iPhone Simulator", "x86_64": deviceMode = "iPhone Simulator"
            
        /// 默认
        default: deviceMode = platform
        }
        
        return deviceMode
    }
}
