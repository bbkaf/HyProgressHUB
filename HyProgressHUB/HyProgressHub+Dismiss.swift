//
//  HyProgressHub+Dismiss.swift
//  SuperHelper
//
//  Created by HankTseng on 2018/7/25.
//  Copyright © 2018年 andr. All rights reserved.
//

import UIKit

extension HyProgressHUB {
    
    
    
    @objc public func dismiss(in view: UIView?, with state: DismissState = .success, after: Double = 0.0, complete: (() -> Void)? = nil) {

        if let `view` = view {
            DispatchQueue.main.async {
                for i in view.subviews {
                    if i.tag == 1700110034 {
                        if let progressImage = i as? UIImageView {
                            if state == .success {
                                if self.setSuccessGif != nil && self.setSuccessGif != self.setLoadingGif {
                                    progressImage.image = UIImage.gif(name: self.setSuccessGif!)
                                } else if self.setSuccessGif == nil {
                                    progressImage.image = UIImage.gif(name: "animat-checkmark-color", bundle: Bundle(for: HyProgressHUB.self))
                                }
                            } else {
                                if self.setFailureGif != nil && self.setFailureGif != self.setLoadingGif {
                                    progressImage.image = UIImage.gif(name: self.setFailureGif!)
                                } else if self.setFailureGif == nil {
                                    progressImage.image = UIImage.gif(name: "animat-rocket-color", bundle: Bundle(for: HyProgressHUB.self))
                                }
                            }
                        }
                    }
                    
                    if i.tag == 1700110038 {
                        if let lottieAnimationView = i as? UIView {
                            if state == .success {
                                if self.setSuccessLottie != nil {
                                    lottieAnimationView.removeFromSuperview()
                                    self.setSuccessLottie?.frame = CGRect(x: view.center.x - 40, y: view.center.y - 40, width: 80.0, height: 80.0)
                                    self.setSuccessLottie?.tag = 1700110038
                                    view.addSubview(self.setSuccessLottie!)
                                } else if self.setSuccessLottie == nil {
                                    if i.tag == 1700110034 {
                                        if let progressImage = i as? UIImageView {
                                            progressImage.image = UIImage.gif(name: "animat-checkmark-color", bundle: Bundle(for: HyProgressHUB.self))
                                        }
                                    }
                                }
                            } else {
                                if self.setFailLottie != nil {
                                    lottieAnimationView.removeFromSuperview()
                                    self.setFailLottie?.frame = CGRect(x: view.center.x - 40, y: view.center.y - 40, width: 80.0, height: 80.0)
                                    self.setFailLottie?.tag = 1700110038
                                    view.addSubview(self.setFailLottie!)
                                } else if self.setFailureGif == nil {
                                    if i.tag == 1700110034 {
                                        if let progressImage = i as? UIImageView {
                                            progressImage.image = UIImage.gif(name: "animat-rocket-color", bundle: Bundle(for: HyProgressHUB.self))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            
            let mircoSec = Int(after * 1000)
            let deadlineTime = DispatchTime.now() + after
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                view.isUserInteractionEnabled = true
                for i in view.subviews {
                    print(i.tag)
                    if i.tag == 1700110032 || i.tag == 1700110033 || i.tag == 1700110034 || i.tag == 1700110035 || i.tag == 1700110036 || i.tag == 1700110038{
                        print(i.tag)
                        i.removeFromSuperview()
                    }
                }
                
                if view.layer.sublayers != nil {
                    for i in view.layer.sublayers! {
                        if i.name == "1700110036" || i.name == "1700110037" {
                            i.removeFromSuperlayer()
                            i.removeAllAnimations()
                        }
                    }
                }
                if complete != nil {
                    complete!()
                }
            }
        }
    }
}
