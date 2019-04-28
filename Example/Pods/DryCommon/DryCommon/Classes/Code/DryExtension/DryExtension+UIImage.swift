//
//  DryExtension+UIImage.swift
//  DryExtension
//
//  Created by Ruiying Duan on 2019/4/20.
//

import UIKit
import Foundation

//MARK: - 扩展(UIImage)
extension UIImage {
    
    /// @说明 压缩图片
    /// @参数 maxByte:    压缩上限(Byte)
    /// @返回 UIImage
    @objc
    @discardableResult
    public func dry_compress(withMaxBytes maxByte: Int) -> UIImage {
        
        /// 数据检查
        var compression: CGFloat = 1
        guard var data = self.jpegData(compressionQuality: compression), data.count > maxByte else {
            return self
        }
        
        /// 压缩质量
        var max: CGFloat = 1
        var min: CGFloat = 0
        for _ in 0..<6 {
            compression = (max + min) / 2
            data = self.jpegData(compressionQuality: compression)!
            if CGFloat(data.count) < CGFloat(maxByte) * 0.9 {
                min = compression
            } else if data.count > maxByte {
                max = compression
            } else {
                break
            }
        }
        var resultImage: UIImage = UIImage(data: data)!
        if data.count < maxByte { return resultImage }
        
        /// 压缩尺寸
        var lastDataLength: Int = 0
        while data.count > maxByte, data.count != lastDataLength {
            lastDataLength = data.count
            let ratio: CGFloat = CGFloat(maxByte) / CGFloat(data.count)
            let size: CGSize = CGSize(width: Int(resultImage.size.width * sqrt(ratio)),
                                      height: Int(resultImage.size.height * sqrt(ratio)))
            UIGraphicsBeginImageContext(size)
            resultImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            resultImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            data = resultImage.jpegData(compressionQuality: compression)!
        }
        
        return resultImage
    }
}
