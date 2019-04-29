//
//  DryNavBar.swift
//  DryNavBar
//
//  Created by Ruiying Duan on 2019/3/29.
//

import UIKit

//MARK: - Item所在导航栏位置
@objc
public enum DryNavBarLocation: Int {
    /// 左部
    case left   = 0
    /// 右部
    case right  = 1
}

//MARK: - 添加Item类型
@objc
public enum DryNavBarAddMode: Int {
    /// 追加
    case append     = 0
    /// 插入
    case insert     = 1
    /// 替换
    case replace    = 2
}

//MARK: - Item图文类型
@objc
public enum DryNavBarContentMode: Int {
    /// 无
    case none           = -1
    /// 仅标题
    case title          = 0
    /// 仅图片
    case image          = 1
    /// 左图右文
    case imageLeft      = 2
    /// 右图左文
    case imageRight     = 3
    /// 上图下文
    case imageTop       = 4
    /// 下图上文
    case imageBottom    = 5
}

//MARK: - 导航栏标题类型
@objc
public enum DryNavBarTitleMode: Int {
    /// 跟随
    case automatic  = 0
    /// 大标题
    case always     = 1
    /// 小标题
    case never      = 2
}

//MARK: - DryNavBar(基础属性)
@objc
public class DryNavBar: NSObject {
    
    /// @说明 隐藏导航栏
    /// @参数 vc: 视图控制器
    /// @返回 void
    @objc
    public static func setNavBarHidden(_ hidden: Bool,
                                       vc: UIViewController,
                                       animated: Bool) {
        
        vc.navigationController?.setNavigationBarHidden(hidden, animated: animated)
    }

    /// @说明 导航栏宽度
    /// @参数 vc: 视图控制器
    /// @返回 CGFloat
    @objc
    @discardableResult
    public static func navBarWidth(at vc: UIViewController) -> CGFloat {
        
        /// 检查导航控制器
        guard let nav = vc.navigationController else {
            return 0.0
        }
        
        /// 获取宽度
        let width: CGFloat = nav.navigationBar.frame.size.width
        
        return width
    }
    
    /// @说明 导航栏高度
    /// @参数 vc: 视图控制器
    /// @返回 CGFloat
    @objc
    @discardableResult
    public static func navBarHeight(at vc: UIViewController) -> CGFloat {
        
        /// 检查导航控制器
        guard let nav = vc.navigationController else {
            return 0.0
        }
        
        /// 获取高度
        let height: CGFloat = nav.navigationBar.frame.size.height
        
        return height
    }
}
