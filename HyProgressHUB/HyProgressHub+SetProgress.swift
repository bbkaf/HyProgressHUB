//
//  HyProgressHub+SetProgress.swift
//  HyProgressHUB
//
//  Created by HankTseng on 2018/8/1.
//  Copyright © 2018年 HyerTech. All rights reserved.
//

import Foundation

extension HyProgressHUB {
    
    
    
    /// Set the current progress persent on the HyProgressHUB
    ///  
    /// - parameter view: The view which progress persent you want to set
    /// - parameter persent: The current progress persent (from 0.0 to 1.0)
    @objc public func setProgressPersent(in view: UIView?, persent: Double) {
        if let `view` = view {
            print(persent)
            DispatchQueue.main.async {
                
                if self.setDynamicBackgroundAlpha {
                    if self.setBackgroundShadowAlpha != 0.0 {
                        self.shadowImage?.alpha = (max(self.setBackgroundShadowAlpha - CGFloat(persent), 0.0) + 0.2)
                    }
                    if self.setBackgroundBlurAlpha != 0.0 {
                        self.blurEffectView?.alpha = (max(self.setBackgroundBlurAlpha - CGFloat(persent), 0.0) + 0.2)
                    }
                }
                
                if self.setProgressLabel {
                    let progressInt = Int(persent * 100.0)
                    self.titleLabel.text = "\(self.title ?? "")(\(progressInt)%)"
                }
                
                if self.setProgressSlider {
                    let progressInt = Int(persent * 100.0)
                    let progressPersent = CGFloat(progressInt) / 100 * self.setProgressSliderWidth
                    self.innerProgressSlider.frame = CGRect(x: view.center.x - self.setProgressSliderWidth/2, y: view.center.y + (self.setMidAreaHeight/2)+4, width: progressPersent, height: self.setProgressSliderHeight)
                }
                
                if self.showCircleProgressIndicator {
                    let progressInt = Int(persent * 100.0)
                    let circlePersent = Double(progressInt) / 100 * 2
                    
                    let center = CGPoint(x: view.center.x, y: view.center.y)
                    let radius = CGFloat(20)
                    let startAngle = CGFloat(-Double.pi * 0.5)
                    let endAngle = CGFloat(Double.pi * circlePersent - Double.pi * 0.5)
                    let path = UIBezierPath()
                    path.move(to: center)
                    path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
                    path.close()
                    path.fill()
                    self.progressShapeLayer.path = path.cgPath
                }
            }
        }
    }
}
