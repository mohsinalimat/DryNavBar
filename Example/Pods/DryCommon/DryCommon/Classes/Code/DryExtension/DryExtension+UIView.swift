//
//  DryExtension+UIView.swift
//  DryExtension
//
//  Created by Ruiying Duan on 2019/4/20.
//

import UIKit
import Foundation
import CoreGraphics

//MARK: - 画线常量
private let kUint: CGFloat          = (1 / UIScreen.main.scale)
private let kAdjustOffset: CGFloat  = ((1 / UIScreen.main.scale) / 2)

//MARK: - 扩展(UIView)
extension UIView {
    
    /// @说明 添加一像素高度的水平子视图
    /// @参数 color:  水平子视图背景色
    /// @参数 width:  水平子视图宽度
    /// @参数 x:      水平子视图x轴坐标
    /// @参数 y:      水平子视图y轴坐标
    /// @返回 void
    @objc
    public func dry_addHorLine(withColor color: UIColor,
                               width: CGFloat,
                               x: CGFloat,
                               y: CGFloat) {
        
        let rect: CGRect = CGRect(x: x - kAdjustOffset, y: y, width: width, height: kUint)
        let view = UIView.init(frame: rect)
        view.backgroundColor = color
        self.addSubview(view)
    }
    
    /// @说明 添加一像素宽度的垂直子视图
    /// @参数 color:  垂直子视图背景色
    /// @参数 height: 垂直子视图高度
    /// @参数 x:      垂直子视图x轴坐标
    /// @参数 y:      垂直子视图y轴坐标
    /// @返回 void
    @objc
    public func dry_addVerLine(withColor color: UIColor,
                               height: CGFloat,
                               x: CGFloat,
                               y: CGFloat) {
        
        let rect: CGRect = CGRect(x: x - kAdjustOffset, y: y, width: kUint, height: height)
        let view = UIView.init(frame: rect)
        view.backgroundColor = color
        self.addSubview(view)
    }
}
