//
//  DryFunc+Screen.swift
//  DryFunc
//
//  Created by Ruiying Duan on 2019/4/17.
//

import UIKit
import Foundation

//MARK: - iPhone屏幕类型
@objc
public enum DryScreenMode: Int {
    
    /// 3.5寸(iphone4/4s)
    case is35
    /// 4.0寸(iPhone5/5c/5s)
    case is40
    /// 4.7寸(iPhone6/6s、7/7s、8/8s)
    case is47
    /// 5.5寸(iPhone6p、7p、8p)
    case is55
    /// 5.8寸(iphoneX/Xs)
    case is58
    /// 6.1寸(iphoneXr)
    case is61
    /// 6.5寸(iphoneXs Max)
    case is65
    
    /// 取值
    public var value: Bool {
        
        get {
            
            switch self {
            case .is35:
                return DryFunc.isScreen(withWidth: 640, height: 960)
            case .is40:
                return DryFunc.isScreen(withWidth: 640, height: 1136)
            case .is47:
                return DryFunc.isScreen(withWidth: 750, height: 1334)
            case .is55:
                return DryFunc.isScreen(withWidth: 1242, height: 2208)
            case .is58:
                return DryFunc.isScreen(withWidth: 1125, height: 2436)
            case .is61:
                return DryFunc.isScreen(withWidth: 828, height: 1792)
            case .is65:
                return DryFunc.isScreen(withWidth: 1242, height: 2688)
            }
        }
    }
}

//MARK: - 通用方法(屏幕)
extension DryFunc {
    
    /// @说明 判断屏幕尺寸
    /// @参数 width:  屏幕宽度
    /// @参数 height: 屏幕高度
    /// @返回 Bool
    @objc
    @discardableResult
    public static func isScreen(withWidth width: CGFloat, height: CGFloat) -> Bool {
        return (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: width, height: height).equalTo((UIScreen.main.currentMode?.size)!) : false)
    }
    
    /// @说明 屏幕宽度
    /// @返回 CGFloat
    @objc
    @discardableResult
    public static func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    /// @说明 屏幕高度
    /// @返回 CGFloat
    @objc
    @discardableResult
    public static func screenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    /// @说明 状态栏高度
    /// @返回 CGFloat
    @objc
    @discardableResult
    public static func statusBarHeight() -> CGFloat {
        return ((DryScreenMode.is58.value || DryScreenMode.is61.value || DryScreenMode.is65.value) ? 44.0 : 20.0)
    }
    
    /// @说明 底部安全区域高度
    /// @返回 CGFloat
    @objc
    @discardableResult
    public static func bottomSafeHeight() -> CGFloat {
        return ((DryScreenMode.is58.value || DryScreenMode.is61.value || DryScreenMode.is65.value) ? 83.0 : 49.0)
    }
    
    /// @说明 导航栏的高度
    /// @返回 CGFloat
    @objc
    @discardableResult
    public static func navBarHeight(at vc: UIViewController) -> CGFloat {
        
        if let nav = vc.navigationController {
            return nav.navigationBar.frame.size.height
        }else {
            return 0
        }
    }
}
