//
//  DryNavBar+Badge.swift
//  DryNavBar
//
//  Created by Ruiying Duan on 2019/4/7.
//

import UIKit
import DryCommon

//MARK: - 常量
/// 角标值边距
private let kBadgeValueSideSpace: CGFloat   = 4

//MARK: - DryNavBar(Badage)
extension DryNavBar {
    
    /// @说明 获取Badge角标值
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 Int?
    @discardableResult
    public static func badgeValue(at vc: UIViewController,
                                  location: DryNavBarLocation,
                                  index: Int) -> Int? {
        
        guard let customView = DryNavBarCustomView.getCustomView(at: vc, location: location, index: index) else {
            return nil
        }
        
        guard let badge = customView.badge else {
            return nil
        }
        
        guard let badgeStr = badge.text else {
            return nil
        }
        
        guard let value = Int(badgeStr) else {
            return nil
        }
        
        return value
    }
}

//MARK: - DryNavBar(Badge)
extension DryNavBar {
    
    /// @说明 是否隐藏Badge
    /// @参数 hide:       是否隐藏
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 void
    @objc
    public static func setBadgeHide(_ hide: Bool,
                                    vc: UIViewController,
                                    location: DryNavBarLocation,
                                    index: Int) {
        
        guard let customView = DryNavBarCustomView.getCustomView(at: vc, location: location, index: index) else {
            return
        }
    
        guard let badge = customView.badge else {
            return
        }
        
        badge.isHidden = hide
    }
    
    /// @说明 设置Badge背景色
    /// @参数 color:      背景色
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 void
    @objc
    public static func setBadgeBgColor(_ color: UIColor,
                                       vc: UIViewController,
                                       location: DryNavBarLocation,
                                       index: Int) {
        
        guard let customView = DryNavBarCustomView.getCustomView(at: vc, location: location, index: index) else {
            return
        }
        
        guard let badge = customView.badge else {
            return
        }
        
        badge.backgroundColor = color
    }
    
    /// @说明 设置Badge半径
    /// @参数 radius:     半径
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 void
    @objc
    public static func setBadgeRadius(_ radius: CGFloat,
                                      vc: UIViewController,
                                      location: DryNavBarLocation,
                                      index: Int) {
        
        guard let customView = DryNavBarCustomView.getCustomView(at: vc, location: location, index: index) else {
            return
        }
        
        guard let badge = customView.badge else {
            return
        }
        
        /// 半径
        customView.badgeWidth?.constant = radius * 2.0
        customView.badgeHeight?.constant = radius * 2.0
        badge.layer.cornerRadius = radius
        customView.setNeedsLayout()
        
        /// 重置Badge宽度
        if let valueStr = badge.text {
            
            let badgeWidth = badge.frame.size.width
            let minWidth = valueStr.dry_size(withFont: badge.font).width + kBadgeValueSideSpace * 2
            if badgeWidth < minWidth  {
                customView.badgeWidth?.constant = minWidth
                customView.setNeedsDisplay()
            }
        }
    }
    
    /// @说明 设置Badge垂直偏移
    /// @参数 offsetY:    偏移量
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 void
    @objc
    public static func setBadgeOffsetY(_ offsetY: CGFloat,
                                       vc: UIViewController,
                                       location: DryNavBarLocation,
                                       index: Int) {
        
        guard let customView = DryNavBarCustomView.getCustomView(at: vc, location: location, index: index) else {
            return
        }
        
        guard let badge = customView.badge else {
            return
        }
        
        let radius = badge.frame.size.width / 2.0
        customView.badgeTop?.constant = radius + offsetY
        customView.setNeedsLayout()
    }
    
    /// @说明 设置Badge水平偏移
    /// @参数 offsetX:    偏移量
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 void
    @objc
    public static func setBadgeOffsetX(_ offsetX: CGFloat,
                                       vc: UIViewController,
                                       location: DryNavBarLocation,
                                       index: Int) {
        
        guard let customView = DryNavBarCustomView.getCustomView(at: vc, location: location, index: index) else {
            return
        }
        
        guard let badge = customView.badge else {
            return
        }
        
        let radius = badge.frame.size.width / 2.0
        customView.badgeRight?.constant = -(radius + offsetX)
        customView.setNeedsLayout()
    }
    
    /// @说明 设置Badge字体颜色
    /// @参数 color:      字体颜色
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 void
    @objc
    public static func setBadgeColor(_ color: UIColor,
                                     vc: UIViewController,
                                     location: DryNavBarLocation,
                                     index: Int) {
        
        guard let customView = DryNavBarCustomView.getCustomView(at: vc, location: location, index: index) else {
            return
        }
        
        guard let badge = customView.badge else {
            return
        }
        
        badge.textColor = color
    }
    
    /// @说明 设置Badge角标值
    /// @参数 value:      角标值
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 void
    @objc
    public static func setBadgeValue(_ value: Int,
                                     vc: UIViewController,
                                     location: DryNavBarLocation,
                                     index: Int) {
        
        guard let customView = DryNavBarCustomView.getCustomView(at: vc, location: location, index: index) else {
            return
        }
        
        guard let badge = customView.badge else {
            return
        }
        
        badge.text = "\(value)"
        
        /// 重置Badge宽度
        if let valueStr = badge.text {
            
            let badgeWidth = badge.frame.size.width
            let minWidth = valueStr.dry_size(withFont: badge.font).width + kBadgeValueSideSpace * 2
            if badgeWidth < minWidth  {
                customView.badgeWidth?.constant = minWidth
                customView.setNeedsDisplay()
            }
        }
    }
    
    /// @说明 设置Badge字体属性
    /// @参数 font:       字体属性
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 void
    @objc
    public static func setBadgeFont(_ font: UIFont,
                                    vc: UIViewController,
                                    location: DryNavBarLocation,
                                    index: Int) {
        
        guard let customView = DryNavBarCustomView.getCustomView(at: vc, location: location, index: index) else {
            return
        }
        
        guard let badge = customView.badge else {
            return
        }
        
        badge.font = font
        
        /// 重置Badge宽度
        if let valueStr = badge.text {
            
            let badgeWidth = badge.frame.size.width
            let minWidth = valueStr.dry_size(withFont: badge.font).width + kBadgeValueSideSpace * 2
            if badgeWidth < minWidth  {
                customView.badgeWidth?.constant = minWidth
                customView.setNeedsDisplay()
            }
        }
    }
}
