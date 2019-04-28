//
//  DryFunc+Color.swift
//  DryFunc
//
//  Created by Ruiying Duan on 2019/4/17.
//

import UIKit
import Foundation

//MARK: - 通用方法(颜色)
extension DryFunc {
    
    /// @说明 16进制字符串字转换为UIColor
    /// @参数 hex:    16进制字符串(例如: "FFFFFF")
    /// @参数 alpha:  透明度(0.0~1.0)
    /// @返回 UIColor
    @objc
    @discardableResult
    public static func color(withHex hex: String, alpha: CGFloat) -> UIColor {
        
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.clear
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                       green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                       blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                       alpha: alpha)
    }
}
