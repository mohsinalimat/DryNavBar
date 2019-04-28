//
//  DryNavBarButton.swift
//  DryNavBar
//
//  Created by Ruiying Duan on 2019/3/29.
//

import UIKit

//MARK: - UIBarButtonItem自定义视图上的图文按钮
internal class DryNavBarButton: UIButton {

    /** 属性 */
    /// 图文类型
    internal var contentType: DryNavBarContentMode = .title
    /// 图文间距
    internal var titleImageSpace: CGFloat = 0.0
    /// “左图右文” 或者 “右图左文” 时图文垂直偏移量；“上图下文” 标题距离底部的间距；”上文下图“ 图片距离底部的间距
    internal var bottomSpace: CGFloat = 0.0
    
    /** 构造 */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /** 析构 */
    deinit {}
}

//MARK: - 便利构造
extension DryNavBarButton {
    
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
        
        /// 保存数据
        self.contentType = contentMode
        self.titleImageSpace = titleImageSpace
        self.bottomSpace = bottomSpace
    }
}

//MARK: - 布局
extension DryNavBarButton {
    
    /** 重载: 子视图布局 */
    override func layoutSubviews() {
        
        /// 继承父类
        super.layoutSubviews()
        
        /// 检查父视图
        guard let superView = self.superview else {
            return
        }
        
        guard superView is DryNavBarCustomView else {
            return
        }
        
        /// 父视图属性
        var superViewWidth: CGFloat = 0.0
        let superViewHeight: CGFloat = superView.bounds.size.height
        let superViewX: CGFloat = self.bounds.origin.x
        let superViewY: CGFloat = self.bounds.origin.y
        
        /// ImageView内容的宽度和高度
        let imageViewWidth: CGFloat = self.imageView != nil ? self.imageView!.intrinsicContentSize.width : 0.0
        let imageViewHeight: CGFloat = self.imageView != nil ? self.imageView!.intrinsicContentSize.height : 0.0
        
        /// titleLabel内容的宽度和高度
        let titleLabelWidth: CGFloat = self.titleLabel != nil ? self.titleLabel!.intrinsicContentSize.width : 0.0
        let titleLabelHeight: CGFloat = self.titleLabel != nil ? self.titleLabel!.intrinsicContentSize.height : 0.0
        
        /// 计算按钮父视图宽度:
        /// (1)“仅标题”:                   titleLable的宽度
        /// (2)“仅图片”:                   imageView的宽度
        /// (3)“左图右文” 或者 “右图左文”:    titleLable宽度 + imageView宽度 + 图文间距(titleImageSpace)
        /// (4)“上图下文” 或者 “上文下图”:    titleLable与imageView宽度较大一方的宽度
        if self.contentType == .title {
            superViewWidth = titleLabelWidth
        }else if self.contentType == .image {
            superViewWidth = imageViewWidth
        }else if self.contentType == .imageLeft || self.contentType == .imageRight {
            superViewWidth = imageViewWidth + titleLabelWidth + self.titleImageSpace
        }else if self.contentType == .imageTop || self.contentType == .imageBottom {
            superViewWidth = imageViewWidth >= titleLabelWidth ? imageViewWidth : titleLabelWidth
        }
        
        /// 重置父视图bounds
        superView.bounds = CGRect.init(x: superViewX, y: superViewY, width: superViewWidth, height: superViewHeight)
        
        /// 重设父视图宽度约束
        for constraint in superView.constraints {
            
            if constraint.identifier == kDryNavBarCustomViewWidthConstraintID {
                constraint.constant = superViewWidth
                break
            }
        }
        
        /// 刷新父视布局
        superView.superview?.setNeedsLayout()
        
        /// “上图下文” 或者 “上文下图” 时，重置titleLabel的Frame，避免titleLabel隐藏导致无法设置偏移
        if self.contentType == .imageTop || self.contentType == .imageBottom {
            
            let titleLabelX: CGFloat = (self.titleLabel != nil ? self.titleLabel!.frame.origin.x : 0.0)
            let titleLabelY: CGFloat = (self.titleLabel != nil ? self.titleLabel!.frame.origin.y : 0.0)
            self.titleLabel?.frame = CGRect.init(x: titleLabelX, y: titleLabelY, width: titleLabelWidth, height: titleLabelHeight)
        }
        
        /// 设置图文偏移(UIEdgeInsets注释):
        /// (1)top       为正数的时候，是往下偏移，为负数的时候往上偏移
        /// (2)left      为正数的时候往右偏移，为负数的时候往左偏移
        /// (3)bottom    为正数的时候往上偏移，为负数的时候往下偏移
        /// (4)right     为正数的时候往左偏移，为负数的时候往右偏移
        
        /** 设置图文偏移(仅标题) */
        if self.contentType == .title {
            
            /// titleLable偏移
            let tTop: CGFloat = self.bottomSpace
            let tLeft: CGFloat = 0
            let tBottom: CGFloat = -tTop
            let tRight: CGFloat = -tLeft
            self.titleEdgeInsets = UIEdgeInsets.init(top: tTop, left: tLeft, bottom: tBottom, right: tRight)
        }
        
        /** 设置图文偏移(仅图片) */
        if self.contentType == .image {
            
            /// imageView偏移
            let iTop: CGFloat = self.bottomSpace
            let iLeft: CGFloat = 0
            let iBottom: CGFloat = -iTop
            let iRight: CGFloat = -iLeft
            self.imageEdgeInsets = UIEdgeInsets.init(top: iTop, left: iLeft, bottom: iBottom, right: iRight)
        }
        
        /** 设置图文偏移(左图右文) */
        if self.contentType == .imageLeft {
            
            /// titleLable偏移
            let tTop: CGFloat = self.bottomSpace
            let tLeft: CGFloat = self.titleImageSpace
            let tBottom: CGFloat = -tTop
            let tRight: CGFloat = -tLeft
            self.titleEdgeInsets = UIEdgeInsets.init(top: tTop, left: tLeft, bottom: tBottom, right: tRight)
            
            /// imageView偏移
            let iTop: CGFloat = self.bottomSpace
            let iLeft: CGFloat = 0
            let iBottom: CGFloat = -iTop
            let iRight: CGFloat = -iLeft
            self.imageEdgeInsets = UIEdgeInsets.init(top: iTop, left: iLeft, bottom: iBottom, right: iRight)
        }
        
        /** 设置图文偏移(右图左文) */
        if self.contentType == .imageRight {
            
            /// titleLable偏移
            let tTop: CGFloat = self.bottomSpace
            let tLeft: CGFloat = -imageViewWidth
            let tBottom: CGFloat = -tTop
            let tRight: CGFloat = -tLeft
            self.titleEdgeInsets = UIEdgeInsets.init(top: tTop, left: tLeft, bottom: tBottom, right: tRight)
            
            /// imageView偏移
            let iTop: CGFloat = self.bottomSpace
            let iLeft: CGFloat = titleLabelWidth + self.titleImageSpace
            let iBottom: CGFloat = -iTop
            let iRight: CGFloat = -iLeft
            self.imageEdgeInsets = UIEdgeInsets.init(top: iTop, left: iLeft, bottom: iBottom, right: iRight)
        }
        
        /** 设置图文偏移(上图下文) */
        if self.contentType == .imageTop {
            
            if imageViewWidth >= titleLabelWidth {
                
                /// titleLable偏移
                var tTop: CGFloat = 0.0
                let tLeft: CGFloat = -(imageViewWidth / 2.0 + titleLabelWidth / 2.0)
                let tBottom: CGFloat = -((superViewHeight - titleLabelHeight) / 2.0 - self.bottomSpace)
                tTop = -tBottom
                let tRight: CGFloat = -tLeft
                self.titleEdgeInsets = UIEdgeInsets.init(top: tTop, left: tLeft, bottom: tBottom, right: tRight)
                
                /// imageView偏移
                let iTop: CGFloat = -((titleLabelHeight + self.bottomSpace + self.titleImageSpace) - (superViewHeight - imageViewHeight) / 2.0)
                let iLeft: CGFloat = 0.0
                let iBottom: CGFloat = -iTop
                let iRight: CGFloat = -0.0
                self.imageEdgeInsets = UIEdgeInsets.init(top: iTop, left: iLeft, bottom: iBottom, right: iRight)
                
            }else {
                
                /// titleLable偏移
                var tTop: CGFloat = 0.0
                let tLeft: CGFloat = -imageViewWidth
                let tBottom: CGFloat = -((superViewHeight - titleLabelHeight) / 2.0 - self.bottomSpace)
                tTop = -tBottom
                let tRight: CGFloat = -tLeft
                self.titleEdgeInsets = UIEdgeInsets.init(top: tTop, left: tLeft, bottom: tBottom, right: tRight)
                
                /// imageView偏移
                let iTop: CGFloat = -((titleLabelHeight + self.bottomSpace + self.titleImageSpace) - (superViewHeight - imageViewHeight) / 2.0)
                let iLeft: CGFloat = (titleLabelWidth - imageViewWidth) / 2.0
                let iBottom: CGFloat = -iTop
                let iRight: CGFloat = -iLeft
                self.imageEdgeInsets = UIEdgeInsets.init(top: iTop, left: iLeft, bottom: iBottom, right: iRight)
            }
        }
        
        /** 设置图文偏移(下图上文) */
        if self.contentType == .imageBottom {
            
            if imageViewWidth >= titleLabelWidth {
                
                /// titleLable偏移
                let tTop: CGFloat = -((imageViewHeight + self.bottomSpace + self.titleImageSpace) - (superViewHeight - titleLabelHeight) / 2.0)
                let tLeft: CGFloat = -(imageViewWidth / 2.0 + titleLabelWidth / 2.0)
                let tBottom: CGFloat = -tTop
                let tRight: CGFloat = -tLeft
                self.titleEdgeInsets = UIEdgeInsets.init(top: tTop, left: tLeft, bottom: tBottom, right: tRight)
                
                /// imageView偏移
                var iTop: CGFloat = 0.0
                let iLeft: CGFloat = 0.0
                let iBottom: CGFloat = -((superViewHeight - imageViewHeight) / 2.0 - self.bottomSpace)
                iTop = -iBottom
                let iRight: CGFloat = -0.0
                self.imageEdgeInsets = UIEdgeInsets.init(top: iTop, left: iLeft, bottom: iBottom, right: iRight)
                
            }else {
                
                /// titleLable偏移
                let tTop: CGFloat = -((imageViewHeight + self.bottomSpace + self.titleImageSpace) - (superViewHeight - titleLabelHeight) / 2.0)
                let tLeft: CGFloat = -imageViewWidth
                let tBottom: CGFloat = -tTop
                let tRight: CGFloat = -tLeft
                self.titleEdgeInsets = UIEdgeInsets.init(top: tTop, left: tLeft, bottom: tBottom, right: tRight)
                
                /// imageView偏移
                var iTop: CGFloat = 0.0
                let iLeft: CGFloat = (titleLabelWidth - imageViewWidth) / 2.0
                let iBottom: CGFloat = -((superViewHeight - imageViewHeight) / 2.0 - self.bottomSpace)
                iTop = -iBottom
                let iRight: CGFloat = -iLeft
                self.imageEdgeInsets = UIEdgeInsets.init(top: iTop, left: iLeft, bottom: iBottom, right: iRight)
            }
        }
    }
}
