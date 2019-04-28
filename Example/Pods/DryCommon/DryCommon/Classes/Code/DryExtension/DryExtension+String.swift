//
//  DryExtension+String.swift
//  DryExtension
//
//  Created by Ruiying Duan on 2019/4/19.
//

import UIKit
import Foundation
import CoreGraphics
import CommonCrypto

//MARK: - 扩展(String)
extension String {
    
    /// @说明 计算字符串尺寸
    /// @参数 font:   字符串属性
    /// @返回 CGSize
    @discardableResult
    public func dry_size(withFont font: UIFont) -> CGSize {
        
        let tmpSize: CGSize = CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let attr: [NSAttributedString.Key: Any] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): font]
        let option: NSStringDrawingOptions = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect: CGRect = self.boundingRect(with: tmpSize, options: option, attributes: attr, context: nil)
        let size: CGSize = rect.size
        
        return size
    }
    
    /// @说明 剪裁字符串两边的空格
    /// @返回 String
    @discardableResult
    public func dry_trimSide() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    /// @说明 剪裁字符串所有的空格
    /// @返回 String
    @discardableResult
    public func dry_trimAll() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
}
