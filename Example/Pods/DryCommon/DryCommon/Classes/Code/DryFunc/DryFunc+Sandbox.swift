//
//  DryFunc+Sandbox.swift
//  DryFunc
//
//  Created by Ruiying Duan on 2019/4/17.
//

import UIKit
import Foundation

//MARK: - 通用方法(沙盒)
extension DryFunc {
    
    /// @说明 获取沙盒Doucument路径
    /// @返回 String
    @objc
    @discardableResult
    public static func documentPath() -> String {
        
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        guard !documentPaths.isEmpty else {
            return ""
        }
        
        return documentPaths[0]
    }
    
    /// @说明 获取沙盒Cache路径
    /// @返回 String
    @objc
    @discardableResult
    public static func cachePath() -> String {
        
        let cachePaths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        guard !cachePaths.isEmpty else {
            return ""
        }
        
        return cachePaths[0]
    }
}
