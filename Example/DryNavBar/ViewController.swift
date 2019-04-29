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
    }
}

