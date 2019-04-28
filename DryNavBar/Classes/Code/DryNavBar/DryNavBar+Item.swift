//
//  DryNavBar+Item.swift
//  DryNavBar
//
//  Created by Ruiying Duan on 2019/4/6.
//

import UIKit

//MARK: - DryNavBar(Item开关)
extension DryNavBar {
    
    /// @说明 开关Item集合
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 enable:     开关
    /// @返回 void
    @objc
    public static func enableItems(at vc: UIViewController,
                                   location: DryNavBarLocation,
                                   enable: Bool) {
        
        /// 检查导航控制器
        guard let _ = vc.navigationController else {
            return
        }
        
        /// 获取item集合
        var currentItems: [UIBarButtonItem]?
        switch location {
        case .left:
            currentItems = vc.navigationItem.leftBarButtonItems
        case .right:
            currentItems = vc.navigationItem.rightBarButtonItems
        }
        
        /// 开关
        if currentItems == nil {
            return
        }
        
        for item in currentItems! {
            item.isEnabled = enable
        }
    }
    
    /// @说明 开关Item
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @参数 enable:     开关
    /// @返回 void
    @objc
    public static func enableItem(at vc: UIViewController,
                                  location: DryNavBarLocation,
                                  index: Int,
                                  enable: Bool) {
        
        /// 检查导航控制器
        guard let _ = vc.navigationController else {
            return
        }
        
        /// 获取导航栏左部或者右部item集合
        var currentItems: [UIBarButtonItem]?
        switch location {
        case .left:
            currentItems = vc.navigationItem.leftBarButtonItems
        case .right:
            currentItems = vc.navigationItem.rightBarButtonItems
        }
        
        /// 开关
        if currentItems == nil || currentItems!.isEmpty {
            return
        }
        
        if index >= 0 && index < currentItems!.count {
            let item: UIBarButtonItem = currentItems![index]
            item.isEnabled = enable
        }
    }
}

//MARK: - DryNavBar(Item获取)
extension DryNavBar {

    /// @说明 获取Item集合
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @返回 [UIBarButtonItem]?
    @objc
    @discardableResult
    public static func items(at vc: UIViewController, location: DryNavBarLocation) -> [UIBarButtonItem]? {
        
        /// 检查导航控制器
        guard let _ = vc.navigationController else {
            return nil
        }
        
        /// 获取item集合
        switch location {
        case .left:
            return vc.navigationItem.leftBarButtonItems
        case .right:
            return vc.navigationItem.rightBarButtonItems
        }
    }
    
    /// @说明 获取Item
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 UIBarButtonItem?
    @objc
    @discardableResult
    public static func item(at vc: UIViewController,
                            location: DryNavBarLocation,
                            index: Int) -> UIBarButtonItem? {
        
        /// 检查导航控制器
        guard let _ = vc.navigationController else {
            return nil
        }
        
        /// 获取item集合
        var currentItems: [UIBarButtonItem]?
        switch location {
        case .left:
            currentItems = vc.navigationItem.leftBarButtonItems
        case .right:
            currentItems = vc.navigationItem.rightBarButtonItems
        }
        
        /// 获取指定位置Item
        if currentItems == nil || currentItems!.isEmpty {
            return nil
        }
        
        guard index >= 0 && index < currentItems!.count else {
            return nil
        }
        
        return currentItems![index]
    }
    
    /// @说明 获取item的坐标(所在视图控制器)
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 CGRect?
    @objc
    @discardableResult
    public static func itemRect(at vc: UIViewController,
                                location: DryNavBarLocation,
                                index: Int) -> CGRect {
        
        /// 检查导航控制器
        guard let _ = vc.navigationController else {
            return CGRect.zero
        }
        
        /// 获取item集合
        var currentItems: [UIBarButtonItem]?
        switch location {
        case .left:
            currentItems = vc.navigationItem.leftBarButtonItems
        case .right:
            currentItems = vc.navigationItem.rightBarButtonItems
        }
        
        /// 获取Rect
        if currentItems == nil || currentItems!.isEmpty {
            return CGRect.zero
        }
        
        guard index >= 0 && index < currentItems!.count else {
            return CGRect.zero
        }
        
        let item: UIBarButtonItem = currentItems![index]
        guard let customView = item.customView else {
            return CGRect.zero
        }
        
        return customView.convert(customView.bounds, to: vc.view)
    }
}

//MARK: - DryNavBar(Item删除)
extension DryNavBar {
    
    /// @说明 删除item集合
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @返回 void
    @objc
    public static func removeItems(at vc: UIViewController, location: DryNavBarLocation) {
        
        /// 检查导航控制器
        guard let _ = vc.navigationController else {
            return
        }
        
        /// 删除
        switch location {
        case .left:
            vc.navigationItem.leftBarButtonItems = nil
        case .right:
            vc.navigationItem.rightBarButtonItems = nil
        }
    }
    
    /// @说明 删除item
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      Item索引
    /// @返回 void
    @objc
    public static func removeItem(at vc: UIViewController,
                                  location: DryNavBarLocation,
                                  index: Int) {
        
        /// 检查导航控制器
        guard let _ = vc.navigationController else {
            return
        }
        
        /// 初始化item集合
        var currentItems: [UIBarButtonItem]?
        switch location {
        case .left:
            currentItems = vc.navigationItem.leftBarButtonItems
        case .right:
            currentItems = vc.navigationItem.rightBarButtonItems
        }
        
        /// 删除
        if currentItems == nil || currentItems!.isEmpty {
            return
        }
        
        guard index >= 0 && index < currentItems!.count else {
            return
        }
        
        currentItems!.remove(at: index)
    }
}

//MARK: - DryNavBar(Item添加)
extension DryNavBar {
    
    /// @说明 添加Item
    /// @参数 vc:                 视图控制器
    /// @参数 location:           Item位置
    /// @参数 addMode:            Item添加模式
    /// @参数 contentMode:        图文类型(不可以为none类型)
    /// @参数 index:              Item索引
    /// @参数 title:              标题
    /// @参数 titleColor:         标题颜色
    /// @参数 titleFont:          标题属性
    /// @参数 image:              图片
    /// @参数 titleImageSpace:    图文间距
    /// @参数 bottomSpace:        底部间距
    /// @参数 target:             Item执行的target
    /// @参数 action:             Item执行的selectors
    /// @返回 UIBarButtonItem?
    @objc
    @discardableResult
    public static func addItem(at vc: UIViewController,
                               location: DryNavBarLocation,
                               addMode: DryNavBarAddMode,
                               contentMode: DryNavBarContentMode,
                               index: Int,
                               title: String?,
                               titleColor: UIColor?,
                               titleFont: UIFont?,
                               image: UIImage?,
                               titleImageSpace: CGFloat,
                               bottomSpace: CGFloat,
                               target: Any?,
                               action: Selector?) -> UIBarButtonItem? {
        
        /// 检查导航控制器
        guard let _ = vc.navigationController else {
            return nil
        }
        
        /// 检查图文类型
        if contentMode == .none {
            return nil
        }
        
        /// 初始化Item宽度和高度
        let itemWidth: CGFloat = 0
        let itemHeight: CGFloat = DryNavBar.navBarHeight(at: vc)
        
        /// 检查数据
        var realTitleImageSpace: CGFloat = 0.0
        if titleImageSpace >= 0.0 {
            realTitleImageSpace = titleImageSpace
        }
        
        /// 创建自定义UIBarButtonItem
        let rect: CGRect = CGRect.init(x: 0.0, y: 0.0, width: itemWidth, height: itemHeight)
        let customView = DryNavBarCustomView.init(frame: rect,
                                                  contentMode: contentMode,
                                                  titleImageSpace: realTitleImageSpace,
                                                  bottomSpace: bottomSpace)
        
        /// 设置自定义视图宽度约束
        let widthAnchor = customView.widthAnchor.constraint(equalToConstant: itemWidth)
        widthAnchor.identifier = kDryNavBarCustomViewWidthConstraintID
        widthAnchor.isActive = true
        
        /// 设置自定义视图高度约束
        let heightAnchor = customView.heightAnchor.constraint(equalToConstant: itemHeight)
        heightAnchor.identifier = kDryNavBarCustomViewHeightConstraintID
        heightAnchor.isActive = true
        
        /// 检查自定义控件
        if customView.btn == nil {
            return nil
        }
        
        /// 根据图文类型创建Item
        let item: UIBarButtonItem = UIBarButtonItem.init(customView: customView)
        if contentMode == .title && title != nil {
            
            customView.btn!.setTitle(title, for: .normal)
            customView.btn!.setTitleColor(titleColor, for: .normal)
            customView.btn!.titleLabel?.font = titleFont
            customView.btn!.contentHorizontalAlignment = .center
            
        }else if contentMode == .image && image != nil {
            
            let tmpImage: UIImage = image!.withRenderingMode(.alwaysOriginal)
            customView.btn!.setImage(tmpImage, for: .normal)
            
        }else if (contentMode == .imageLeft && title != nil && image != nil) {
            
            let tmpImage: UIImage = image!.withRenderingMode(.alwaysOriginal)
            customView.btn!.setImage(tmpImage, for: .normal)
            customView.btn!.setTitle(title, for: .normal)
            customView.btn!.setTitleColor(titleColor, for: .normal)
            customView.btn!.titleLabel?.font = titleFont
            customView.btn!.contentHorizontalAlignment = .left
            
        }else if (contentMode == .imageRight && title != nil && image != nil) {
            
            let tmpImage: UIImage = image!.withRenderingMode(.alwaysOriginal)
            customView.btn!.setImage(tmpImage, for: .normal)
            customView.btn!.setTitle(title, for: .normal)
            customView.btn!.setTitleColor(titleColor, for: .normal)
            customView.btn!.titleLabel?.font = titleFont
            customView.btn!.contentHorizontalAlignment = .left
            
        }else if (contentMode == .imageTop && title != nil && image != nil) {
            
            let tmpImage: UIImage = image!.withRenderingMode(.alwaysOriginal)
            customView.btn!.setImage(tmpImage, for: .normal)
            customView.btn!.setTitle(title, for: .normal)
            customView.btn!.setTitleColor(titleColor, for: .normal)
            customView.btn!.titleLabel?.font = titleFont
            customView.btn!.contentHorizontalAlignment = .left
            
        }else if (contentMode == .imageBottom && title != nil && image != nil) {
            
            let tmpImage: UIImage = image!.withRenderingMode(.alwaysOriginal)
            customView.btn!.setImage(tmpImage, for: .normal)
            customView.btn!.setTitle(title, for: .normal)
            customView.btn!.setTitleColor(titleColor, for: .normal)
            customView.btn!.titleLabel?.font = titleFont
            customView.btn!.contentHorizontalAlignment = .left
            
        }else {
            return nil
        }
        
        /// 设置Action
        if action != nil && customView.btn != nil {
            customView.btn!.addTarget(target, action: action!, for: .touchUpInside)
        }
        
        /// 获取item集合
        var currentItems: [UIBarButtonItem]?
        switch location {
        case .left:
            currentItems = vc.navigationItem.leftBarButtonItems
        case .right:
            currentItems = vc.navigationItem.rightBarButtonItems
        }
        
        /// 检查Item
        if currentItems == nil {
            currentItems = []
        }
        
        /// 添加类型
        if addMode == .append {
            currentItems! += [item]
        }else if currentItems!.isEmpty || index < 0 || index >= currentItems!.count {
            return nil
        }else if addMode == .insert {
            currentItems!.insert(item, at: index)
        }else if addMode == .replace {
            currentItems![index] = item
        }
        
        /// 设置导航栏
        switch location {
        case .left:
            vc.navigationItem.leftBarButtonItems = currentItems
        case .right:
            vc.navigationItem.rightBarButtonItems = currentItems
        }
        
        return item
    }
    
    /// @说明 添加自定义的Item
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 addMode:    Item添加模式
    /// @参数 index:      item索引
    /// @参数 view:       自定义视图
    /// @返回 UIBarButtonItem?
    @objc
    @discardableResult
    public static func addCustomItem(at vc: UIViewController,
                                     location: DryNavBarLocation,
                                     addMode: DryNavBarAddMode,
                                     index: Int,
                                     view: UIView) -> UIBarButtonItem? {
        
        /// 检查导航控制器
        guard let _ = vc.navigationController else {
            return nil
        }
        
        /// 初始化Item宽度和高度
        let itemWidth: CGFloat = view.frame.size.width
        let itemHeight: CGFloat = view.frame.size.height
        
        /// 创建自定义UIBarButtonItem
        let rect: CGRect = CGRect.init(x: 0.0, y: 0.0, width: itemWidth, height: itemHeight)
        let customView = DryNavBarCustomView.init(frame: rect,
                                                  contentMode: .none,
                                                  titleImageSpace: 0.0,
                                                  bottomSpace: 0.0)
        
        /// 设置自定义UIBarButtonItem宽度和高度约束
        customView.widthAnchor.constraint(equalToConstant: itemWidth).isActive = true
        customView.heightAnchor.constraint(equalToConstant: itemHeight).isActive = true
        
        /// 在customView上添加aView
        customView.addSubview(view)
        
        /// 创建Item
        let item: UIBarButtonItem = UIBarButtonItem.init(customView: customView)
        
        /// 获取item集合
        var currentItems: [UIBarButtonItem]?
        switch location {
        case .left:
            currentItems = vc.navigationItem.leftBarButtonItems
        case .right:
            currentItems = vc.navigationItem.rightBarButtonItems
        }
        
        /// 检查Item
        if currentItems == nil {
            currentItems = []
        }
        
        /// 添加类型
        if addMode == .append {
            currentItems! += [item]
        }else if currentItems!.isEmpty || index < 0 || index >= currentItems!.count {
            return nil
        }else if addMode == .insert {
            currentItems!.insert(item, at: index)
        }else if addMode == .replace {
            currentItems![index] = item
        }
        
        /// 设置导航栏
        switch location {
        case .left:
            vc.navigationItem.leftBarButtonItems = currentItems
        case .right:
            vc.navigationItem.leftBarButtonItems = currentItems
        }
        
        return item
    }
}

//MARK: - DryNavBar(Item属性)
extension DryNavBar {
    
    /// @说明 设置Item图文间距
    /// @参数 space:      图文间距
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      item索引
    /// @返回 UIBarButtonItem?
    @objc
    public static func setItemTitleImageSpace(_ space: CGFloat,
                                              vc: UIViewController,
                                              location: DryNavBarLocation,
                                              index: Int) {
        
        /// 获取自定义按钮
        guard let btn = DryNavBarCustomView.getCustomButton(at: vc, location: location, index: index) else {
            return
        }
        
        /// 检查图文类型
        let contentMode = btn.contentType
        if contentMode == .none || contentMode == .title || contentMode == .image {
            return
        }
        
        /// 检查数据
        if space < 0 {
            return
        }
        
        /// 设置图文间距
        btn.titleImageSpace = space
        btn.setNeedsLayout()
    }
    
    /// @说明 设置Item底部间距
    /// @参数 space:      底部间距
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      item索引
    /// @返回 UIBarButtonItem?
    @objc
    public static func setItemBottomSpace(_ space: CGFloat,
                                          vc: UIViewController,
                                          location: DryNavBarLocation,
                                          index: Int) {
        
        /// 获取自定义按钮
        guard let btn = DryNavBarCustomView.getCustomButton(at: vc, location: location, index: index) else {
            return
        }
        
        /// 检查图文类型
        let contentMode = btn.contentType
        if contentMode == .none {
            return
        }
        
        /// 设置底部间距
        btn.bottomSpace = space
        btn.setNeedsLayout()
    }
    
    /// @说明 设置Item标题
    /// @参数 title:      标题
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      item索引
    /// @返回 UIBarButtonItem?
    @objc
    public static func setItemTitle(_ title: String,
                                    vc: UIViewController,
                                    location: DryNavBarLocation,
                                    index: Int) {
        
        /// 获取自定义按钮
        guard let btn = DryNavBarCustomView.getCustomButton(at: vc, location: location, index: index) else {
            return
        }
        
        /// 检查图文类型
        let contentMode = btn.contentType
        if contentMode == .none || contentMode == .image {
            return
        }
        
        /// 设置标题
        btn.setTitle(title, for: .normal)
    }
    
    /// @说明 设置Item标题颜色
    /// @参数 color:      标题颜色
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      item索引
    /// @返回 UIBarButtonItem?
    @objc
    public static func setItemTitleColor(_ color: UIColor,
                                         vc: UIViewController,
                                         location: DryNavBarLocation,
                                         index: Int) {
        
        /// 获取自定义按钮
        guard let btn = DryNavBarCustomView.getCustomButton(at: vc, location: location, index: index) else {
            return
        }
        
        /// 检查图文类型
        let contentMode = btn.contentType
        if contentMode == .none || contentMode == .image {
            return
        }
        
        /// 设置标题颜色
        btn.setTitleColor(color, for: .normal)
    }
    
    /// @说明 设置Item标题Font
    /// @参数 font:       标题font
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      item索引
    /// @返回 UIBarButtonItem?
    @objc
    public static func setItemTitleFont(_ font: UIFont,
                                        vc: UIViewController,
                                        location: DryNavBarLocation,
                                        index: Int) {
        
        /// 获取自定义按钮
        guard let btn = DryNavBarCustomView.getCustomButton(at: vc, location: location, index: index) else {
            return
        }
        
        /// 检查图文类型
        let contentMode = btn.contentType
        if contentMode == .none || contentMode == .image {
            return
        }
        
        /// 设置标题属性
        btn.titleLabel?.font = font
    }
    
    /// @说明 设置Item图片
    /// @参数 image:      图片
    /// @参数 vc:         视图控制器
    /// @参数 location:   Item位置
    /// @参数 index:      item索引
    /// @返回 UIBarButtonItem?
    @objc
    public static func setItemImage(_ image: UIImage?,
                                    vc: UIViewController,
                                    location: DryNavBarLocation,
                                    index: Int) {
        
        /// 获取自定义按钮
        guard let btn = DryNavBarCustomView.getCustomButton(at: vc, location: location, index: index) else {
            return
        }
        
        /// 检查图文类型
        let contentMode = btn.contentType
        if contentMode == .none || contentMode == .title {
            return
        }
        
        /// 设置图片
        var tmpImage: UIImage? = nil
        if image != nil {
            tmpImage = image!.withRenderingMode(.alwaysOriginal)
        }
        btn.setImage(tmpImage, for: .normal)
    }
}
