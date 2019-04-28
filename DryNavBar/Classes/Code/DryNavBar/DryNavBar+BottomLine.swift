//
//  DryNavBar+BottomLine.swift
//  DryNavBar
//
//  Created by Ruiying Duan on 2019/4/5.
//

import UIKit
import DryCommon

//MARK: - DryNavBar(底部横线视图)
extension DryNavBar {
    
    /// @说明 导航栏底部横线视图
    /// @参数 view:   "当前视图控制器" 所在 "导航控制器" 的 "navigationBar" 属性(vc.nav.navigationBar)
    /// @返回 UIImageView?
    @discardableResult
    internal static func bottomLine(at view: UIView) -> UIImageView? {
        
        /// 如果是小于或者等于1单位高度的UIImageView，直接返回该视图
        if (view is UIImageView) && (view.bounds.size.height <= 1.0)  {
            return view as? UIImageView
        }
        
        /// 遍历查找
        for subview in view.subviews {
            
            if let imageView = DryNavBar.bottomLine(at: subview) {
                return imageView
            }
        }
        
        return nil
    }
}

//MARK: - DryNavBar(底部横线视图)
extension DryNavBar {
    
    /// @说明 设置底部横线视图属性
    /// @参数 vc:     视图控制器
    /// @参数 color:  背景色
    /// @参数 alpha:  背景透明度(0.0~1.0)
    /// @返回 void
    @objc
    public static func setBottomLine(at vc: UIViewController,
                                     color: UIColor,
                                     alpha: CGFloat) {
        
        /// 检查导航控制器
        guard let nav = vc.navigationController else {
            return
        }
        
        /// 置空系统图片
        nav.navigationBar.shadowImage = UIImage()
        
        /// 透明色
        if color.cgColor === UIColor.clear.cgColor {
            return
        }
        
        /// 底部横线视图
        guard let bottomLine = DryNavBar.bottomLine(at: nav.navigationBar) else {
            return
        }
        
        /// 移除 “底部横线视图” 的子视图
        bottomLine.subviews.forEach { (subView) in
            subView.removeFromSuperview()
        }
        
        /// 添加1像素高度的水平视图到 “底部横线视图”
        let alphaColor: UIColor = color.withAlphaComponent(alpha)
        let width: CGFloat = DryNavBar.navBarWidth(at: vc)
        bottomLine.dry_addHorLine(withColor: alphaColor, width: 0, x: 0, y: width)
    }
}
