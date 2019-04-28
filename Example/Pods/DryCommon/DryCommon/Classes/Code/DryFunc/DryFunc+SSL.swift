//
//  DryFunc+SSL.swift
//  DryFunc
//
//  Created by Ruiying Duan on 2019/4/17.
//

import UIKit
import Foundation
import Security

//MARK: - 通用方法(SSL)
extension DryFunc {
    
    /// @说明 获取cer证书
    /// @参数 path:   .cer证书文件的路径
    /// @返回 SecCertificate?
    @objc
    @discardableResult
    public static func cerCertificate(from path: String) -> SecCertificate? {
        
        /// 检查数据
        guard FileManager.default.fileExists(atPath: path) else {
            return nil
        }
        
        /// 获取证书数据
        guard let cerData = NSData.init(contentsOfFile: path) else {
            return nil
        }
        
        guard let certificate = SecCertificateCreateWithData(kCFAllocatorDefault, cerData) else {
            return nil
        }
        
        return certificate
    }
    
    /// @说明 获取cer证书公钥
    /// @参数 path:   .cer证书文件的路径
    /// @参数 result: SecKey?
    /// @返回 void
    @objc
    public static func cerPublicKey(from path: String, result: @escaping (SecKey?) -> Void) {
        
        /// 检查数据
        guard FileManager.default.fileExists(atPath: path) else {
            result(nil)
            return
        }
        
        /// 获取证书数据
        guard let cerData = NSData.init(contentsOfFile: path) else {
            result(nil)
            return
        }
        
        guard let certificate = SecCertificateCreateWithData(kCFAllocatorDefault, cerData) else {
            result(nil)
            return
        }
        
        let policy: SecPolicy = SecPolicyCreateBasicX509()
        var trust: SecTrust?
        var status: OSStatus = SecTrustCreateWithCertificates(certificate, policy, &trust)
        
        guard status == noErr else {
            result(nil)
            return
        }
        
        if trust == nil {
            result(nil)
            return
        }
        
        var trustResult = SecTrustResultType.init(rawValue: 0)
        if trustResult == nil {
            result(nil)
            return
        }
        
        status = SecTrustEvaluate(trust!, &trustResult!)
        
        /// 获取公钥
        let secKey: SecKey? = SecTrustCopyPublicKey(trust!)
        
        /// 回调
        result(secKey)
    }
}
