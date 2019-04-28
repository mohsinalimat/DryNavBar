//
//  DryNavBar+Background.swift
//  DryNavBar
//
//  Created by Ruiying Duan on 2019/4/5.
//

import UIKit
import DryCommon

//MARK: - DryNavBar(背景)
extension DryNavBar {
    
    /// @说明 设置背景属性
    /// @参数 vc:     视图控制器
    /// @参数 color:  背景色
    /// @参数 alpha:  背景透明度(0.0~1.0)
    /// @返回 void
    @objc
    public static func setBackground(at vc: UIViewController,
                                     color: UIColor,
                                     alpha: CGFloat) {
        
        /// 检查导航控制器
        guard let nav = vc.navigationController else {
            return
        }
        
        /// 透明
        if alpha == 0 || color.cgColor === UIColor.clear.cgColor {
            nav.navigationBar.setBackgroundImage(UIImage(), for: .default)
            nav.navigationBar.isTranslucent = true
            return
        }
        
        /// 不透明(注意: alpha不能给1, 否则导致VC向下偏移Nav的高度)
        if alpha == 1 {
            nav.navigationBar.barTintColor = color
            nav.navigationBar.isTranslucent = false
            return
        }
        
        /// 半透明
        if alpha > 0 && alpha < 1 {
            let alphaColor: UIColor = color.withAlphaComponent(alpha)
            let bgImage: UIImage? = DryFunc.image(withColor: alphaColor)
            nav.navigationBar.setBackgroundImage(bgImage, for: .default)
            nav.navigationBar.isTranslucent = true
        }
    }
}
