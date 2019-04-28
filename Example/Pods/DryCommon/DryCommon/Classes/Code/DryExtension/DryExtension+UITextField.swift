//
//  DryExtension+UITextField.swift
//  DryExtension
//
//  Created by Ruiying Duan on 2019/4/20.
//

import UIKit
import Foundation

//MARK: - 扩展(UITextField)
extension UITextField {
    
    /// @说明 设置placeholder
    /// @参数 ph:    placeholder内容
    /// @返回 void
    @objc
    public func dry_setPlaceholder(_ ph: String) {
        self.attributedPlaceholder = NSMutableAttributedString.init(string: ph)
    }
    
    /// @说明 设置placeholder的颜色
    /// @参数 color:  字体颜色
    /// @返回 void
    @objc
    public func dry_setPlaceholderColor(_ color: UIColor) {
        
        /// 获取placeholder
        guard let attrStr = self.attributedPlaceholder as? NSMutableAttributedString else {
            return
        }
        
        /// 防越界
        let attrStrLength: Int = attrStr.length
        if attrStrLength == 0 {
            return
        }
        
        /// 设置颜色
        let range: NSRange = NSRange.init(location: 0, length: attrStrLength)
        attrStr.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        self.attributedPlaceholder = attrStr
    }
    
    /// @说明 设置placeholder的颜色
    /// @参数 color:  字体颜色
    /// @参数 range:  范围
    /// @返回 void
    @objc
    public func dry_setPlaceholderColor(_ color: UIColor, range: NSRange) {
        
        /// 获取placeholder
        guard let attrStr = self.attributedPlaceholder as? NSMutableAttributedString else {
            return
        }
        
        /// 防越界
        let attrStrLength: Int = attrStr.length
        if (attrStrLength == 0) || (range.location > attrStrLength - 1) {
            return
        }
        
        if range.length > attrStrLength - range.location {
            return
        }
        
        /// 设置颜色
        attrStr.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        self.attributedPlaceholder = attrStr
    }
    
    /// @说明 设置placeholder的Font
    /// @参数 font:   属性
    /// @返回 void
    @objc
    public func dry_setPlaceholderFont(_ font: UIFont) {
        
        /// 获取placeholder
        guard let attrStr = self.attributedPlaceholder as? NSMutableAttributedString else {
            return
        }
        
        /// 防越界
        let attrStrLength: Int = attrStr.length
        if attrStrLength == 0 {
            return
        }
        
        /// 设置Font
        let range: NSRange = NSRange.init(location: 0, length: attrStrLength)
        attrStr.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        self.attributedPlaceholder = attrStr
    }
    
    /// @说明 设置placeholder的Font
    /// @参数 font:   属性
    /// @参数 range:  范围
    /// @返回 void
    @objc
    public func dry_setPlaceholderFont(_ font: UIFont, range: NSRange) {
        
        /// 获取placeholder
        guard let attrStr = self.attributedPlaceholder as? NSMutableAttributedString else {
            return
        }
        
        /// 防越界
        let attrStrLength: Int = attrStr.length
        if (attrStrLength == 0) || (range.location > attrStrLength - 1) {
            return
        }
        
        if range.length > attrStrLength - range.location {
            return
        }
        
        /// 设置Font
        attrStr.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        self.attributedPlaceholder = attrStr
    }
}
