//
//  HyProgressHub.swift
//  SuperHelper
//
//  Created by HankTseng on 2018/7/15.
//  Copyright © 2018年 Hyer bbkaf. All rights reserved.
//

import UIKit



public class HyProgressHUB: UIView {
    
    public init(type: HyProgressType, style: HyProgressStyle) {
        let tempFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
        super.init(frame: tempFrame)
        self.style = style
        self.type = type
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    //    @objc public static let shared = HyProgressHUB(type: .progressCircle, style: .shadowBackground)
    
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
    open var setLoadingLottie: UIView? = nil
    open var setSuccessLottie: UIView? = nil
    open var setFailLottie: UIView? = nil
    
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
    internal var lottieAnimationView: UIView? = nil
    internal var targetView: UIView? = nil
    internal var progressImage = UIImageView()
    internal var titleLabel = UILabel()
    internal var innerProgressSlider = UIImageView()
    internal var progressShapeLayer = CAShapeLayer()

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
                
                if self.setProgressLabel {
                    let progressInt = Int(persent * 100.0)
                    self.titleLabel.text = "\(self.title ?? "")(\(progressInt)%)"
                }
                
                if self.setProgressSlider {
                    let progressInt = Int(persent * 100.0)
                    let progressPersent = CGFloat(progressInt) / 100 * 106
                    self.innerProgressSlider.frame = CGRect(x: view.center.x - 53, y: view.center.y + 56, width: progressPersent, height: 2.0)
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


