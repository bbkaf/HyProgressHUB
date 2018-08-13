//
//  HyProgressHub+SetupUI.swift
//  HyProgressHUB
//
//  Created by HankTseng on 2018/8/1.
//  Copyright © 2018年 HyerTech. All rights reserved.
//

import UIKit

extension HyProgressHUB {
    
    internal func setupUI(_ title: String?, view: UIView?, isUserInteractionEnabled: Bool) {
        if let `view` = view {
            self.frame = view.frame
            view.isUserInteractionEnabled = isUserInteractionEnabled
            serBlurEffectView()
            if self.type == .gif {
                setGif()
            }
            
            if self.type == .lottie {
                setLottie()
            }
            
            setTheTitle(title: title)
            
            
            setTheProgressSlider()
            setTheProgressCircle()
        }
    }
    
    internal func setGif() {
        ///gif image
        if setLoadingGif != nil {
            progressImage.image = UIImage.gif(name: setLoadingGif!)
            progressImage.frame = CGRect(x: self.center.x - setIconWidth/2, y: self.center.y - setIconHeight/2, width: setIconWidth, height: setIconHeight)
        } else {
            let path = Bundle(for: HyProgressHUB.self).resourcePath! + "/demoGif.bundle"
            
            progressImage.image = UIImage.gif(name: "animat-pencil-color", bundle: Bundle(for: HyProgressHUB.self))
            progressImage.frame = CGRect(x: self.center.x - setIconWidth/2, y: self.center.y - setIconHeight/2, width: setIconWidth, height: setIconHeight)
        }
    }
    
    internal func setLottie() {
        ///lottie
        if setLoadingLottie != nil {
            lottieAnimationView = setLoadingLottie
            lottieAnimationView?.frame = CGRect(x: self.center.x - setIconWidth/2, y: self.center.y - setIconHeight/2, width: setIconWidth, height: setIconHeight)
        } else {
            let a = Bundle(for: HyProgressHUB.self)
            let path = Bundle(for: HyProgressHUB.self).resourcePath! + "/demoGif.bundle"
            progressImage.image = UIImage.gif(name: "animat-rocket-color", bundle: Bundle(for: HyProgressHUB.self))
            progressImage.frame = CGRect(x: self.center.x - setIconWidth/2, y: self.center.y - setIconHeight/2, width: setIconWidth, height: setIconHeight)
        }
    }
    
    internal func setTheTitle(title: String?) {
        ///title
        titleLabel = UILabel(frame: CGRect(x: self.center.x - setTitleWidth/2, y: self.center.y + (setMidAreaHeight/2)+2-44, width: setTitleWidth, height: 44.0))
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        
        ///progressLabel
        titleLabel.textColor = self.setTitleColor
        self.title = title
        titleLabel.text = self.title
        
    }
    
    internal func setTheProgressCircle() {
        ///progressCircle inner
        let center = CGPoint(x: self.center.x, y: self.center.y)
        let radius = CGFloat(20)
        let startAngle = CGFloat(-Double.pi * 0.5)
        let endAngle = CGFloat(Double.pi * 0 - Double.pi * 0.5)
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.close()
        
        progressShapeLayer = CAShapeLayer()
        progressShapeLayer.path = path.cgPath
        
        //change the fill color
        progressShapeLayer.fillColor = UIColor.lightGray.cgColor
        //you can change the stroke color
        progressShapeLayer.strokeColor = UIColor.lightGray.cgColor
        //you can change the line width
        progressShapeLayer.lineWidth = 0.0
        
        ///progressCircle outer
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.center.x,y: self.center.y), radius: CGFloat(20), startAngle: CGFloat(-Double.pi * 0.5), endAngle:CGFloat(Double.pi * 1.5), clockwise: true)
        progressShapeOuterLayer = CAShapeLayer()
        progressShapeOuterLayer.path = circlePath.cgPath
        progressShapeOuterLayer.fillColor = UIColor.clear.cgColor
        progressShapeOuterLayer.strokeColor = UIColor.lightGray.cgColor
        progressShapeOuterLayer.lineWidth = 1.0
    }
    
    internal func setTheProgressSlider() {
        ///progressSlider
        progressSlider = UIImageView(frame: CGRect(x: self.center.x - setProgressSliderWidth/2, y: self.center.y + (setMidAreaHeight/2)+4, width: setProgressSliderWidth, height: setProgressSliderHeight))
        progressSlider.layer.cornerRadius = 3.0
        progressSlider.backgroundColor = UIColor.darkGray
        
        innerProgressSlider = UIImageView(frame: CGRect(x: self.center.x - setProgressSliderWidth/2, y: self.center.y + setTitleWidth/2, width: 0, height: setProgressSliderHeight))
        innerProgressSlider.layer.cornerRadius = 1.0
        innerProgressSlider.backgroundColor = UIColor.lightGray
    }
    
    internal func serBlurEffectView() {
        let blurEffect = UIBlurEffect(style: setBackgroundBlurStyle)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.frame = self.frame
        blurEffectView?.alpha = setBackgroundBlurAlpha
        
        shadowImage = UIImageView(frame: self.frame)
        shadowImage?.backgroundColor = UIColor.black.withAlphaComponent(setBackgroundShadowAlpha)
        
        littleSpinner.center = self.center
        littleSpinner.startAnimating()
        
        midBlurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: setMidBlurStyle))
        midBlurEffectView.frame = CGRect(x: self.center.x - setMidAreaWidth/2, y: self.center.y - setMidAreaHeight/2, width: setMidAreaWidth, height: setMidAreaHeight)
        midBlurEffectView.clipsToBounds = true
        midBlurEffectView.layer.cornerRadius = 12
        midBlurEffectView.alpha = self.setMidBlurAlpha
    }
    
    internal func setProgressStyle() {
        ///style setting
        switch self.style {
        case .shadowBackground:
            self.addSubview(self.shadowImage!)
        case .blurBackground:
            self.addSubview(self.blurEffectView!)
        case .clear:
            break
        }
        
        if self.setMidBlur {
            self.addSubview(self.midBlurEffectView)
        }
    }
    
    internal func setProgressType() {
        
        ///type setting
        switch self.type {
        case .simple:
            self.addSubview(self.littleSpinner)
        case .gif:
            self.addSubview(self.progressImage)
        case .lottie:
            if self.lottieAnimationView != nil {
                self.addSubview(self.lottieAnimationView!)
            } else {
                self.addSubview(self.progressImage)
            }
        case .progressCircle:
            self.showCircleProgressIndicator = true
            self.layer.addSublayer(self.progressShapeLayer)
            self.layer.addSublayer(self.progressShapeOuterLayer)
        }
        
        ///customer setting
        if self.setProgressSlider {
            self.addSubview(self.progressSlider)
            self.addSubview(self.innerProgressSlider)
        }
        
        
        
        ///title for all type
        self.addSubview(self.titleLabel)
        
    }
}
