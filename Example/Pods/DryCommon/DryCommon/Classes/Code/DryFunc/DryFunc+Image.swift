//
//  DryFunc+Image.swift
//  DryFunc
//
//  Created by Ruiying Duan on 2019/4/17.
//

import UIKit
import Foundation

//MARK: - 通用方法(图片)
extension DryFunc {
    
    /// @说明 绘制指定圆角背景色的UIImage
    /// @参数 rect:       绘制范围
    /// @参数 radius:     圆角半径
    /// @参数 corner:     指定圆角类型
    /// @参数 bgColor:    背景色
    /// @返回 UIImage?
    @objc
    @discardableResult
    public static func cornerImage(withRect rect: CGRect,
                                   radius: CGFloat,
                                   corner: UIRectCorner,
                                   bgColor: UIColor) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        let cornerRadii = CGSize.init(width: radius, height: radius)
        let path: UIBezierPath = UIBezierPath.init(roundedRect: rect,
                                                   byRoundingCorners: corner,
                                                   cornerRadii: cornerRadii)
        bgColor.setFill()
        path.fill()
        context.addPath(path.cgPath)
        context.clip()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /// @说明 根据颜色值生成UIImage
    /// @参数 color:  颜色
    /// @返回 UIImage?
    @objc
    @discardableResult
    public static func image(withColor color: UIColor) -> UIImage? {
        
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
