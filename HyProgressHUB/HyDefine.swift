//
//  HyDefine.swift
//  HyProgressHUB
//
//  Created by HankTseng on 2018/8/1.
//  Copyright © 2018年 HyerTech. All rights reserved.
//

import Foundation

@objc public enum HyProgressType: Int {
    case simple
    case gif
    case lottie
    case progressCircle
}

@objc public enum HyProgressStyle: Int {
    case shadowBackground
    case blurBackground
    case clear
}

@objc public enum DismissState: Int {
    case success
    case failure
}
