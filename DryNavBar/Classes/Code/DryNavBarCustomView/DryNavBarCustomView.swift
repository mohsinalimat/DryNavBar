//
//  DryNavBarCustomView.swift
//  DryNavBar
//
//  Created by Ruiying Duan on 2019/3/29.
//

import UIKit

//MARK: - 布局常量
/// 自定义视图的宽度约束标识
internal let kDryNavBarCustomViewWidthConstraintID: String  = "kDryNavBarCustomViewWidthConstraintID"
/// 自定义视图的高度约束标识
internal let kDryNavBarCustomViewHeightConstraintID: String = "kDryNavBarCustomViewHeightConstraintID"

//MARK: - UIBarButtonItem自定义视图
internal class DryNavBarCustomView: UIView {
    
    /** 属性(图文按钮) */
    /// 图文按钮
    internal var btn: DryNavBarButton?

    /** 属性(圆点) */
    /// Dot
    internal var dot: UILabel?
    /// 顶部约束
    internal var dotTop: NSLayoutConstraint?
    /// 右部约束
    internal var dotRight: NSLayoutConstraint?
    /// 宽度约束
    internal var dotWidth: NSLayoutConstraint?
    /// 高度约束
    internal var dotHeight: NSLayoutConstraint?
    
    /** 属性(角标) */
    /// Badge
    internal var badge: UILabel?
    /// 顶部约束
    internal var badgeTop: NSLayoutConstraint?
    /// 右部约束
    internal var badgeRight: NSLayoutConstraint?
    /// 宽度约束
    internal var badgeWidth: NSLayoutConstraint?
    /// 高度约束
    internal var badgeHeight: NSLayoutConstraint?
    
    /** 构造 */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /** 析构 */
    deinit {
        
        self.btn = nil
        
        self.dot = nil
        self.dotTop = nil
        self.dotRight = nil
        self.dotWidth = nil
        self.dotHeight = nil
        
        self.badge = nil
        self.badgeTop = nil
        self.badgeRight = nil
        self.badgeWidth = nil
        self.badgeHeight = nil
    }
}

//MARK: - 便利构造
extension DryNavBarCustomView {
    
    /// @说明 便利构造
    /// @参数 frameRect:          frame
    /// @参数 contentMode:        图文类型
    /// @参数 titleImageSpace:    图文间距
    /// @参数 bottomSpace:        底部间距
    /// @返回 void
    internal convenience init(frame frameRect: CGRect,
                              contentMode: DryNavBarContentMode,
                              titleImageSpace: CGFloat,
                              bottomSpace: CGFloat) {
        
        /// 继承父类
        self.init(frame: frameRect)
        
        /// 初始化图文按钮
        self.initBtn(with: contentMode, titleImageSpace: titleImageSpace, bottomSpace: bottomSpace)
        
        /// 初始化Dot控件
        self.initDot()
        
        /// 初始化角标控件
        self.initBadge()
    }
}

//MARK: - 获取控件
extension DryNavBarCustomView {
    
    /** 获取自定义按钮 */
    internal static func getCustomButton(at vc: UIViewController,
                                         location: DryNavBarLocation,
                                         index: Int) -> DryNavBarButton? {
        
        /// 检查导航控制器
        guard let _ = vc.navigationController else {
            return nil
        }
        
        /// 获取自定义视图
        guard let item = DryNavBar.item(at: vc, location: location, index: index) else {
            return nil
        }
        
        guard let customView = item.customView as? DryNavBarCustomView else {
            return nil
        }
        
        return customView.btn
    }
    
    /** 获取自定义视图 */
    internal static func getCustomView(at vc: UIViewController,
                                       location: DryNavBarLocation,
                                       index: Int) -> DryNavBarCustomView? {
        
        /// 检查导航控制器
        guard let _ = vc.navigationController else {
            return nil
        }
        
        /// 获取自定义视图
        guard let item = DryNavBar.item(at: vc, location: location, index: index) else {
            return nil
        }
        
        guard let customView = item.customView as? DryNavBarCustomView else {
            return nil
        }
        
        return customView
    }
}

//MARK: - 图文按钮
extension DryNavBarCustomView {
    
    /** 初始化图文按钮 */
    private func initBtn(with contentMode: DryNavBarContentMode,
                         titleImageSpace: CGFloat,
                         bottomSpace: CGFloat) {
        
        /// 检查图文类型
        guard contentMode != .none else {
            return
        }
        
        /// 初始化
        self.btn = DryNavBarButton.init(frame: CGRect(),
                                        contentMode: contentMode,
                                        titleImageSpace: titleImageSpace,
                                        bottomSpace: bottomSpace)
        
        /// 布局
        self.btn!.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.btn!)
        self.addConstraint(NSLayoutConstraint.init(item: self,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self.btn!,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 0.0))
        self.addConstraint(NSLayoutConstraint.init(item: self,
                                                   attribute: .trailing,
                                                   relatedBy: .equal,
                                                   toItem: self.btn!,
                                                   attribute: .trailing,
                                                   multiplier: 1.0,
                                                   constant: 0.0))
        self.addConstraint(NSLayoutConstraint.init(item: self,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: self.btn!,
                                                   attribute: .top,
                                                   multiplier: 1.0,
                                                   constant: 0.0))
        self.addConstraint(NSLayoutConstraint.init(item: self,
                                                   attribute: .bottom,
                                                   relatedBy: .equal,
                                                   toItem: self.btn!,
                                                   attribute: .bottom,
                                                   multiplier: 1.0,
                                                   constant: 0.0))
    }
}

//MARK: - 圆点
extension DryNavBarCustomView {
    
    /** 初始化控件 */
    private func initDot() {
        
        /// 初始化
        if self.dot == nil {
            self.dot = UILabel()
        }
        
        /// 配置属性
        let radius: CGFloat = 4.0
        self.dot!.isHidden = true
        self.dot!.backgroundColor = UIColor.red
        self.dot!.layer.masksToBounds = true
        self.dot!.layer.cornerRadius = radius
        
        /// 布局
        self.dot!.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.dot!)

        self.dotTop = NSLayoutConstraint.init(item: self,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: self.dot!,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: -(radius * 2))
        self.dotRight = NSLayoutConstraint.init(item: self,
                                                attribute: .trailing,
                                                relatedBy: .equal,
                                                toItem: self.dot!,
                                                attribute: .trailing,
                                                multiplier: 1.0,
                                                constant: -radius)
        self.dotWidth = NSLayoutConstraint.init(item: self.dot!,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: radius * 2.0)
        self.dotHeight = NSLayoutConstraint.init(item: self.dot!,
                                                 attribute: .height,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: radius * 2.0)
        
        self.addConstraint(self.dotTop!)
        self.addConstraint(self.dotRight!)
        self.dot!.addConstraint(self.dotWidth!)
        self.dot!.addConstraint(self.dotHeight!)
    }
}

//MARK: - 角标
extension DryNavBarCustomView {

    /** 初始化 */
    private func initBadge() {

        /// 初始化
        if self.badge == nil {
            self.badge = UILabel()
        }
        
        /// 配置属性
        let radius: CGFloat = 8.0
        self.badge!.isHidden = true
        self.badge!.textAlignment = .center
        self.badge!.textColor = UIColor.white
        self.badge!.font = UIFont.boldSystemFont(ofSize: 10)
        self.badge!.text = "0"
        self.badge!.backgroundColor = UIColor.red
        self.badge!.layer.masksToBounds = true
        self.badge!.layer.cornerRadius = radius
        
        /// 布局
        self.badge!.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.badge!)
        
        self.badgeTop = NSLayoutConstraint.init(item: self,
                                                attribute: .top,
                                                relatedBy: .equal,
                                                toItem: self.badge!,
                                                attribute: .top,
                                                multiplier: 1.0,
                                                constant: 0)
        self.badgeRight = NSLayoutConstraint.init(item: self,
                                                  attribute: .trailing,
                                                  relatedBy: .equal,
                                                  toItem: self.badge!,
                                                  attribute: .trailing,
                                                  multiplier: 1.0,
                                                  constant: -radius)
        self.badgeWidth = NSLayoutConstraint.init(item: self.badge!,
                                                  attribute: .width,
                                                  relatedBy: .greaterThanOrEqual,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: radius * 2.0)
        self.badgeHeight = NSLayoutConstraint.init(item:self.badge!,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: radius * 2.0)
        
        self.addConstraint(self.badgeTop!)
        self.addConstraint(self.badgeRight!)
        self.badge!.addConstraint(self.badgeWidth!)
        self.badge!.addConstraint(self.badgeHeight!)
    }
}
