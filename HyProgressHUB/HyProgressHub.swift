//
//  HyProgressHub.swift
//  SuperHelper
//
//  Created by HankTseng on 2018/7/15.
//  Copyright © 2018年 Hyer bbkaf. All rights reserved.
//

import UIKit

@objc public enum HyProgressType: Int {
    case simple
    case gif
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

@objc public class HyProgressHUB: NSObject {
    
    public init(type: HyProgressType, style: HyProgressStyle) {
        super.init()
        self.style = style
        self.type = type
    }
    
    @objc public static let shared = HyProgressHUB(type: .progressCircle, style: .shadowBackground)
    
    ///open setting properties
    open var setProgressLabel: Bool = false
    open var setProgressSlider: Bool = false
    open var setMidBlur: Bool = false
    open var setLoadingGif: String? = nil
    open var setSuccessGif: String? = nil
    open var setFailureGif: String? = nil
    open var setBackgroundShadowColor: UIColor = .black
    open var setBackgroundShadowAlpha: CGFloat = 0.7
    open var setMidBlurStyle: UIBlurEffectStyle = .light
    open var setMidBlurAlpha: CGFloat = 0.9
    open var setDynamicAlphaWithProgress: Bool = false

    ///internal property
    internal var type: HyProgressType = .simple
    internal var style: HyProgressStyle = .shadowBackground
    internal var blurEffectView: UIVisualEffectView?
    internal var shadowImage: UIImageView?
    internal var midDialog: UIImageView?
    internal var title: String?
    internal var disableUserInteraction: Bool = true
    internal var backgroundBlurStyle: UIBlurEffectStyle = .dark
    internal var backgroundBlurAlpha: CGFloat = 1.0
    internal var littleSpinner = UIActivityIndicatorView(activityIndicatorStyle: .white)
    internal var midBlurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    internal var showCircleProgressIndicator = false
    
    ///open property: progress persent
    
    @objc public func setProgressPersent(in view: UIView?, persent: Double) {
        if let `view` = view {
            print(persent)
            DispatchQueue.main.async {
                
                if self.setDynamicAlphaWithProgress {
                    if self.setBackgroundShadowAlpha != 0.0 {
                        self.shadowImage?.alpha = (max(self.setBackgroundShadowAlpha - CGFloat(persent), 0.0) + 0.2)
                    }
                    if self.backgroundBlurAlpha != 0.0 {
                        self.blurEffectView?.alpha = (max(self.backgroundBlurAlpha - CGFloat(persent), 0.0) + 0.2)
                    }
                }
                
                for i in view.subviews {
                    if self.setProgressLabel {
                        if i.tag == 1700110033 {
                            if let title = i as? UILabel {
                                let progressInt = Int(persent * 100.0)
                                title.text = "\(self.title ?? "")(\(progressInt)%)"
                            }
                        }
                    }
                    
                    if self.setProgressSlider {
                        if i.tag == 1700110035 {
                            if let innerProgressSlider = i as? UIImageView {
                                let progressInt = Int(persent * 100.0)
                                let progressPersent = CGFloat(progressInt) / 100 * 106
                                innerProgressSlider.frame = CGRect(x: view.center.x - 53, y: view.center.y + 56, width: progressPersent, height: 2.0)
                            }
                        }
                    }
                }
                
                if self.showCircleProgressIndicator {
                    if view.layer.sublayers != nil {
                        for i in view.layer.sublayers! {
                            if i.name == "1700110036" {
                                if let shapeLayer = i as? CAShapeLayer {
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
                                    
                                    let circlePath = UIBezierPath(arcCenter: CGPoint(x: view.center.x,y: view.center.y), radius: CGFloat(20), startAngle: CGFloat(-Double.pi * 0.5), endAngle:CGFloat(Double.pi * circlePersent), clockwise: true)
                                    shapeLayer.path = path.cgPath
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
}


