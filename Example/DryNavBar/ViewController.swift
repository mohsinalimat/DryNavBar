//
//  ViewController.swift
//  DryNavBar
//
//  Created by 2237840768@qq.com on 04/28/2019.
//  Copyright (c) 2019 2237840768@qq.com. All rights reserved.
//

import UIKit
import DryNavBar

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DryNavBar.setNavBarHidden(false, vc: self, animated: false)
        
        /// 仅标题
        DryNavBar.addItem(at: self,
                          location: .left,
                          addMode: .append,
                          contentMode: .title,
                          index: 0,
                          title: #"仅标题"#,
                          titleColor: UIColor.black,
                          titleFont: UIFont.systemFont(ofSize: 17),
                          image: nil,
                          titleImageSpace: 0,
                          bottomSpace: 0,
                          target: nil,
                          action: nil)
        DryNavBar.setBadgeHide(false, vc: self, location: .left, index: 0)
        DryNavBar.setBadgeValue(10, vc: self, location: .left, index: 0)
        
        /// 仅图片
        DryNavBar.addItem(at: self,
                          location: .left,
                          addMode: .append,
                          contentMode: .image,
                          index: 1,
                          title: #"仅图片"#,
                          titleColor: nil,
                          titleFont: nil,
                          image: UIImage.init(named: "img"),
                          titleImageSpace: 0,
                          bottomSpace: 0,
                          target: nil,
                          action: nil)
        DryNavBar.setDotHide(false, vc: self, location: .left, index: 1)
        DryNavBar.setDotOffsetX(-2, vc: self, location: .left, index: 1)
        DryNavBar.setDotOffsetY(-3, vc: self, location: .left, index: 1)
        
        /// 上图下文
        DryNavBar.addItem(at: self,
                          location: .left,
                          addMode: .append,
                          contentMode: .imageTop,
                          index: 2,
                          title: #"上图下文"#,
                          titleColor: UIColor.black,
                          titleFont: UIFont.systemFont(ofSize: 10),
                          image: UIImage.init(named: "img2"),
                          titleImageSpace: 0,
                          bottomSpace: 5,
                          target: nil,
                          action: nil)
        
        /// 下图上文
        DryNavBar.addItem(at: self,
                          location: .left,
                          addMode: .append,
                          contentMode: .imageBottom,
                          index: 3,
                          title: #"下图上文"#,
                          titleColor: UIColor.black,
                          titleFont: UIFont.systemFont(ofSize: 10),
                          image: UIImage.init(named: "img2"),
                          titleImageSpace: 0,
                          bottomSpace: 5,
                          target: nil,
                          action: nil)
        
        /// 左图右文
        DryNavBar.addItem(at: self,
                          location: .left,
                          addMode: .append,
                          contentMode: .imageLeft,
                          index: 4,
                          title: #"左图右文"#,
                          titleColor: UIColor.black,
                          titleFont: UIFont.systemFont(ofSize: 10),
                          image: UIImage.init(named: "img2"),
                          titleImageSpace: 0,
                          bottomSpace: 0,
                          target: nil,
                          action: nil)
        
        /// 右图左文
        DryNavBar.addItem(at: self,
                          location: .left,
                          addMode: .append,
                          contentMode: .imageRight,
                          index: 5,
                          title: #"右图左文"#,
                          titleColor: UIColor.black,
                          titleFont: UIFont.systemFont(ofSize: 10),
                          image: UIImage.init(named: "img2"),
                          titleImageSpace: 0,
                          bottomSpace: 0,
                          target: nil,
                          action: nil)
    }
}

