//
//  HyProgressHub+Dismiss.swift
//  SuperHelper
//
//  Created by HankTseng on 2018/7/25.
//  Copyright © 2018年 HyerTech. All rights reserved.
//

import UIKit

extension HyProgressHUB {
    
    
    /**
     # Lists
     
     You can apply *italic*, **bold**, or `code` inline styles.
     
     ## Unordered Lists
     
     - Lists are great,
     - but perhaps don't nest
     - Sub-list formatting
     
     - isn't the best.
     
     ## Ordered Lists
     
     1. Ordered lists, too
     2. for things that are sorted;
     3. Arabic numerals
     4. are the only kind supported.
     */
    
    /// To dismiss HyProgressHUB.
    ///
    /// - parameter view: The view which you want to dismiss HyProgressHUB
    /// - parameter with: The loading result (failure or success)
    /// - parameter after: Dismiss HyProgressHUB after few second
    /// - parameter complete: Call back after HyProgressHUB Dismissed
    @objc public func dismiss(in view: UIView?, with state: DismissState = .success, after: Double = 0.0, complete: (() -> Void)? = nil) {

        if let `view` = view {
            self.frame = view.frame
            DispatchQueue.main.async {
                if state == .success {
                    if self.setSuccessGif != nil && self.setSuccessGif != self.setLoadingGif {
                        self.progressImage.image = UIImage.gif(name: self.setSuccessGif!)
                    } else if self.setSuccessGif == nil {
                        self.progressImage.image = UIImage.gif(name: "animat-checkmark-color", bundle: Bundle(for: HyProgressHUB.self))
                    }
                } else {
                    if self.setFailureGif != nil && self.setFailureGif != self.setLoadingGif {
                        self.progressImage.image = UIImage.gif(name: self.setFailureGif!)
                    } else if self.setFailureGif == nil {
                        self.progressImage.image = UIImage.gif(name: "animat-rocket-color", bundle: Bundle(for: HyProgressHUB.self))
                    }
                }
                
                if state == .success {
                    if self.setSuccessLottie != nil {
                        self.lottieAnimationView?.removeFromSuperview()
                        self.setSuccessLottie?.frame = CGRect(x: view.center.x - 40, y: view.center.y - 40, width: 80.0, height: 80.0)
                        view.addSubview(self.setSuccessLottie!)
                    } else if self.setSuccessLottie == nil {
                        self.progressImage.image = UIImage.gif(name: "animat-checkmark-color", bundle: Bundle(for: HyProgressHUB.self))
                        
                        
                    }
                } else {
                    if self.setFailLottie != nil {
                        self.lottieAnimationView?.removeFromSuperview()
                        self.setFailLottie?.frame = CGRect(x: view.center.x - 40, y: view.center.y - 40, width: 80.0, height: 80.0)
                        view.addSubview(self.setFailLottie!)
                    } else if self.setFailureGif == nil {
                        self.progressImage.image = UIImage.gif(name: "animat-rocket-color", bundle: Bundle(for: HyProgressHUB.self))
                    }
                }
            }
            
            let mircoSec = Int(after * 1000)
            let deadlineTime = DispatchTime.now() + after
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                view.isUserInteractionEnabled = true
                self.removeFromSuperview()
                if complete != nil {
                    complete!()
                }
            }
        }
    }
}
