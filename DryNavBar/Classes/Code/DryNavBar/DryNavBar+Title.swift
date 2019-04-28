//
//  DryNavBar+Title.swift
//  DryNavBar
//
//  Created by Ruiying Duan on 2019/4/5.
//

import UIKit

//MARK: - DryNavBar(标题)
extension DryNavBar {
    
    /// @说明 开关大标题模式(导航控制器)
    /// @参数 enable: 开关
    /// @参数 nav:    导航控制器
    /// @返回 void
    @objc
    public static func setLargeTitlesEnable(_ enable: Bool, nav: UINavigationController?) {
        
        if nav == nil {
            return
        }
        
        if #available(iOS 11.0, *) {
            nav!.navigationBar.prefersLargeTitles = enable
        }
    }
    
    /// @说明 设置大标题模式(视图控制器)
    /// @参数 mode:   大标题展示模式
    /// @参数 vc:     视图控制器
    /// @返回 void
    @objc
    public static func setLargeTitlesMode(_ mode: DryNavBarTitleMode, vc: UIViewController?) {
        
        if vc == nil {
            return
        }
        
        if #available(iOS 11.0, *) {
            
            switch mode {
            case .automatic:
                vc!.navigationItem.largeTitleDisplayMode = .automatic
            case .always:
                vc!.navigationItem.largeTitleDisplayMode = .always
            case .never:
                vc!.navigationItem.largeTitleDisplayMode = .never
            }
        }
    }
    
    /// @说明 设置标题
    /// @参数 title:      标题
    /// @参数 titleColor: 颜色
    /// @参数 titleFont:  属性
    /// @参数 vc:         视图控制器
    /// @返回 void
    @objc
    public static func setTitle(_ title: String,
                                titleColor: UIColor,
                                titleFont: UIFont,
                                vc: UIViewController) {
        
        /// 检查导航控制器
        guard let nav = vc.navigationController else {
            return
        }
        
        /// 置空系统标题视图
        vc.navigationItem.titleView?.subviews.forEach({ (subview) in
            subview.removeFromSuperview()
        })
        vc.navigationItem.titleView = nil
        
        /// 标题、颜色、属性
        vc.navigationItem.title = title
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): titleColor, NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): titleFont]
        
        /// iOS11以下
        guard #available(iOS 11.0, *) else {
            nav.navigationBar.titleTextAttributes = attributes
            return
        }
        
        /// iOS11及以上(非大标题属性)
        guard nav.navigationBar.prefersLargeTitles else {
            nav.navigationBar.titleTextAttributes = attributes
            return
        }
        
        /// iOS11及以上(大标题属性)
        let mode = vc.navigationItem.largeTitleDisplayMode
        if mode == .automatic || mode == .always {
            nav.navigationBar.largeTitleTextAttributes = attributes
        }else {
            nav.navigationBar.titleTextAttributes = attributes
        }
    }
}

//MARK: - DryNavBar(标题进度)
extension DryNavBar {
    
    /// @说明 启动进度动画
    /// @参数 vc:             视图控制器
    /// @参数 title:          标题
    /// @参数 titleColor:     标题颜色
    /// @参数 titleFont:      标题属性
    /// @参数 progressColor:  进度颜色
    /// @参数 progressFont:   进度属性
    /// @参数 space:          标题和进度控件之间的距离
    /// @返回 void
    @objc public static func startTitleAnimate(at vc: UIViewController,
                                               title: String,
                                               titleColor: UIColor,
                                               titleFont: UIFont,
                                               progressColor: UIColor,
                                               progressFont: UIFont,
                                               space: CGFloat) {
        
        /// 检查导航控制器
        guard let _ = vc.navigationController else {
            return
        }
        
        /// 导航栏宽和高
        let width: CGFloat = DryNavBar.navBarWidth(at: vc)
        let height: CGFloat = DryNavBar.navBarHeight(at: vc)
        
        /// titleView
        let titleViewRect: CGRect = CGRect(x: 0.0, y: 0.0, width: width, height: height)
        let titleView: UIView = UIView.init(frame: titleViewRect)
        
        /// 进度控件宽高
        let progressSize: CGFloat = progressFont.pointSize
        
        /// 标题
        let lable: UILabel = UILabel()
        lable.text = title
        lable.textColor = titleColor
        lable.font = titleFont
        lable.textAlignment = .left
        lable.sizeToFit()
        lable.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(lable)
        titleView.addConstraint(NSLayoutConstraint.init(item: titleView,
                                                        attribute: .centerX,
                                                        relatedBy: .equal,
                                                        toItem: lable,
                                                        attribute: .centerX,
                                                        multiplier: 1.0,
                                                        constant: -((progressSize + space) / 2.0)))
        titleView.addConstraint(NSLayoutConstraint.init(item: titleView,
                                                        attribute: .centerY,
                                                        relatedBy: .equal,
                                                        toItem: lable,
                                                        attribute: .centerY,
                                                        multiplier: 1.0,
                                                        constant: 0.0))
        lable.addConstraint(NSLayoutConstraint.init(item: lable,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: height))
        lable.addConstraint(NSLayoutConstraint.init(item: lable,
                                                    attribute: .width,
                                                    relatedBy: .greaterThanOrEqual,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 0.0))
        
        /// 进度
        let tmpUnit: CGFloat = 22.0//进度控件原始宽高值
        let indicatorRect: CGRect = CGRect.init(x: 0.0, y: 0.0, width: tmpUnit, height: tmpUnit)
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView.init(frame: indicatorRect)
        indicator.color = progressColor
        indicator.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(indicator)
        titleView.addConstraint(NSLayoutConstraint.init(item: lable,
                                                        attribute: .leading,
                                                        relatedBy: .equal,
                                                        toItem: indicator,
                                                        attribute: .trailing,
                                                        multiplier: 1.0,
                                                        constant: space))
        titleView.addConstraint(NSLayoutConstraint.init(item: lable,
                                                        attribute: .centerY,
                                                        relatedBy: .equal,
                                                        toItem: indicator,
                                                        attribute: .centerY,
                                                        multiplier: 1.0,
                                                        constant: 0.0))
        indicator.addConstraint(NSLayoutConstraint.init(item: indicator,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: tmpUnit))
        indicator.addConstraint(NSLayoutConstraint.init(item: indicator,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: tmpUnit))
        
        /// 进度控件宽高设置
        let scale: CGFloat = progressSize / tmpUnit
        let transform: CGAffineTransform = CGAffineTransform(scaleX: scale, y: scale)
        indicator.transform = transform
        
        /// 设置自定义标题视图
        vc.navigationItem.titleView = titleView
        
        /// 刷新布局
        titleView.layoutIfNeeded()
        
        /// 启动动画
        indicator.startAnimating()
    }
    
    /// @说明 停止进度动画
    /// @参数 vc: 视图控制器
    /// @返回 void
    @objc
    public static func stopTitleAnimate(at vc: UIViewController) {
        
        /// 视图控制器是否存在导航栏
        guard let _ = vc.navigationController else {
            return
        }
        
        /// 置空系统标题视图
        vc.navigationItem.titleView?.subviews.forEach({ (subview) in
            subview.removeFromSuperview()
        })
        vc.navigationItem.titleView = nil
    }
}
