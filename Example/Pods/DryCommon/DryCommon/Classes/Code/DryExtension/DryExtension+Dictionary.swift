//
//  DryExtension+Dictionary.swift
//  DryExtension
//
//  Created by Ruiying Duan on 2019/4/20.
//

import UIKit
import Foundation

//MARK: - 扩展(Dictionary)
extension Dictionary where Key == String, Value == Any? {
    
    /// @说明 将[String: Any]转换为[String: String]
    /// @参数 replace:    value为nil时的默认替换值
    /// @返回 [String: String]
    @discardableResult
    public func dry_convertAnyValueToString(withDefault replace: String = "") -> [String: String] {
        
        var dict: [String: String] = [:]
        self.forEach { (key, value) in
            
            if let tmp = value {
                dict[key] = "\(tmp)"
            }else {
                dict[key] = replace
            }
        }
        
        return dict
    }
}
