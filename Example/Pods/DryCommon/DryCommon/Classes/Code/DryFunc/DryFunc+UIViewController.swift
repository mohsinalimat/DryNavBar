//
//  DryFunc+UIViewController.swift
//  DryFunc
//
//  Created by Ruiying Duan on 2019/4/17.
//

import UIKit
import Foundation

//MARK: - 通用方法(视图控制器)
extension DryFunc {
    
    /// @说明 获取根视图控制器
    /// @返回 UIViewController?
    @objc
    @discardableResult
    public static func rootViewController() -> UIViewController? {
        
        guard let appDelegate = UIApplication.shared.delegate else {
            return nil
        }
        
        guard let window = appDelegate.window else {
            return nil
        }
        
        guard let root = window?.rootViewController else {
            return nil
        }
        
        return root
    }
    
    /// @说明 获取当前的视图控制器
    /// @返回 UIViewController?
    @objc
    @discardableResult
    public static func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let presented = base?.presentedViewController {
            return DryFunc.currentViewController(base: presented)
        }
        
        if let nav = base as? UINavigationController {
            
            if nav.viewControllers.isEmpty {
                return nav
            }else {
                return DryFunc.currentViewController(base: nav.visibleViewController)
            }
        }
        
        if let tabBar = base as? UITabBarController {
            
            if tabBar.viewControllers == nil || tabBar.viewControllers!.isEmpty {
                return tabBar
            }else {
                return DryFunc.currentViewController(base: tabBar.selectedViewController)
            }
        }
        
        if let split = base as? UISplitViewController {
            
            if split.viewControllers.isEmpty {
                return split
            }else {
                return split.viewControllers.last
            }
        }
        
        return base
    }
}
