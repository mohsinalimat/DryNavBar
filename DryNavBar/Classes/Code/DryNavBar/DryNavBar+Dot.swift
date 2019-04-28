//
//  DryNavBar+Dot.swift
//  DryNavBar
//
//  Created by Ruiying Duan on 2019/4/7.
//

import UIKit

//MARK: - DryNavBar(Dot)
extension DryNavBar {
    
    /// @说明 是否隐藏Dot
    /// @参数 hide:       是否隐藏
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 void
    @objc
    public static func setDotHide(_ hide: Bool,
                                  vc: UIViewController,
                                  location: DryNavBarLocation,
                                  index: Int) {
    
        guard let customView = DryNavBarCustomView.getCustomView(at: vc, location: location, index: index) else {
            return
        }
        
        guard let dot = customView.dot else {
            return
        }
        
        dot.isHidden = hide
    }
    
    /// @说明 设置Dot背景色
    /// @参数 color:      背景色
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 void
    @objc
    public static func setDotBgColor(_ color: UIColor,
                                     vc: UIViewController,
                                     location: DryNavBarLocation,
                                     index: Int) {
        
        guard let customView = DryNavBarCustomView.getCustomView(at: vc, location: location, index: index) else {
            return
        }
        
        guard let dot = customView.dot else {
            return
        }
        
        dot.backgroundColor = color
    }
    
    /// @说明 设置Dot半径
    /// @参数 radius:     半径
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 void
    @objc
    public static func setDotRadius(_ radius: CGFloat,
                                    vc: UIViewController,
                                    location: DryNavBarLocation,
                                    index: Int) {
        
        guard let customView = DryNavBarCustomView.getCustomView(at: vc, location: location, index: index) else {
            return
        }
        
        guard let dot = customView.dot else {
            return
        }
        
        customView.dotWidth?.constant = radius * 2.0
        customView.dotHeight?.constant = radius * 2.0
        dot.layer.cornerRadius = radius
        customView.setNeedsLayout()
    }
    
    /// @说明 设置Dot垂直偏移
    /// @参数 offsetY:    偏移量
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 void
    @objc
    public static func setDotOffsetY(_ offsetY: CGFloat,
                                     vc: UIViewController,
                                     location: DryNavBarLocation,
                                     index: Int) {
        
        guard let customView = DryNavBarCustomView.getCustomView(at: vc, location: location, index: index) else {
            return
        }
        
        guard let dot = customView.dot else {
            return
        }
        
        let radius = dot.frame.size.width / 2.0
        customView.dotTop?.constant = radius + offsetY
        customView.setNeedsLayout()
    }
    
    /// @说明 设置Dot水平偏移
    /// @参数 offsetX:    偏移量
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 void
    @objc
    public static func setDotOffsetX(_ offsetX: CGFloat,
                                     vc: UIViewController,
                                     location: DryNavBarLocation,
                                     index: Int) {
        
        guard let customView = DryNavBarCustomView.getCustomView(at: vc, location: location, index: index) else {
            return
        }
        
        guard let dot = customView.dot else {
            return
        }
        
        let radius = dot.frame.size.width / 2.0
        customView.dotRight?.constant = -(radius + offsetX)
        customView.setNeedsLayout()
    }
}
