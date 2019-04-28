//
//  DryExtension+Data.swift
//  DryExtension
//
//  Created by Ruiying Duan on 2019/4/20.
//

import UIKit
import Foundation

//MARK: - 扩展(Data)
extension Data {
    
    /// @说明 将系统下发的推送Data转换为String
    /// @参数 deviceToekn:  需要解析推送的Data
    /// @返回 String
    @discardableResult
    public func dry_deviceTokenToString() -> String {
        
        let des: String = self.description
        let tmp1: String = des.replacingOccurrences(of: "<", with: "")
        let tmp2: String = tmp1.replacingOccurrences(of: ">", with: "")
        let str: String = tmp2.replacingOccurrences(of: " ", with: "")
        return str
    }
}
