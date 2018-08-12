//
//  HyProgressHub+Show.swift
//  HyProgressHub
//
//  Created by HankTseng on 2018/7/24.
//  Copyright © 2018年 HyerTech. All rights reserved.
//

import UIKit

extension HyProgressHUB {
    /// Show HyProgressHUB on specific view.
    ///
    /// - parameter view:        The view which need a HUB.
    /// - parameter title:       The title told user what are they waiting for. `""` by default.
    /// - parameter isUserInteractionEnabled: Determine whether block UserInteraction or not. `false` by default.
    ///
    @objc public func show(in view: UIView?, title: String? = "", isUserInteractionEnabled: Bool = false) {
        if let `view` = view {
            setupUI(title, view: view, isUserInteractionEnabled: isUserInteractionEnabled)
            var isAdded = false
            for i in view.subviews {
                if let _ = i as? HyProgressHUB {
                    isAdded = true
                }
            }
            
            DispatchQueue.main.async { 
                self.setProgressStyle()
                self.setProgressType()
                if !isAdded {
                    self.isUserInteractionEnabled = false
                    view.addSubview(self)
                }
                
            }
        }
    }    
}
