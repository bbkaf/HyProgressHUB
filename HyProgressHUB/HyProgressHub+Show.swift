//
//  HyProgressHub+Show.swift
//  HyProgressHub
//
//  Created by HankTseng on 2018/7/24.
//  Copyright © 2018年 HyerTech. All rights reserved.
//

import UIKit

extension HyProgressHUB {
    
    
    
    @objc public func show(in view: UIView?, title: String? = "", isUserInteractionEnabled: Bool = false) {
        if let `view` = view {
            self.frame = view.frame
            view.isUserInteractionEnabled = isUserInteractionEnabled
            
            let blurEffect = UIBlurEffect(style: backgroundBlurStyle)
            blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView?.frame = self.frame
            blurEffectView?.tag = 1700110032
            blurEffectView?.alpha = backgroundBlurAlpha
            
            shadowImage = UIImageView(frame: self.frame)
            shadowImage?.tag = 1700110032
            shadowImage?.backgroundColor = UIColor.black.withAlphaComponent(setBackgroundShadowAlpha)
            
            littleSpinner.center = self.center
            littleSpinner.startAnimating()
            littleSpinner.tag = 1700110032
            
            midBlurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: setMidBlurStyle))
            midBlurEffectView.frame = CGRect(x: self.center.x - 60, y: self.center.y - 60, width: 120.0, height: 120.0)
            midBlurEffectView.tag = 1700110032
            midBlurEffectView.clipsToBounds = true
            midBlurEffectView.layer.cornerRadius = 12
            midBlurEffectView.alpha = self.setMidBlurAlpha
            
            setGif()
            
            ///lottie
            if setLoadingLottie != nil {
                lottieAnimationView = setLoadingLottie
                lottieAnimationView?.frame = CGRect(x: self.center.x - 40, y: self.center.y - 40, width: 80.0, height: 80.0)
                lottieAnimationView?.tag = 1700110038
            } else {
                progressImage.image = UIImage.gif(name: "animat-pencil-color", bundle: Bundle(for: HyProgressHUB.self))
                progressImage.frame = CGRect(x: self.center.x - 40, y: self.center.y - 40, width: 80.0, height: 80.0)
                progressImage.tag = 1700110034
            }
            
            ///title
            titleLabel = UILabel(frame: CGRect(x: self.center.x - 56, y: self.center.y + 18, width: 112, height: 44.0))
            titleLabel.minimumScaleFactor = 0.5
            titleLabel.adjustsFontSizeToFitWidth = true
            titleLabel.textAlignment = .center
            self.title = title
            
            ///progressSlider
            let progressSlider = UIImageView(frame: CGRect(x: self.center.x - 53, y: self.center.y + 56, width: 106, height: 2.0))
            progressSlider.layer.cornerRadius = 3.0
            progressSlider.backgroundColor = UIColor.darkGray
            progressSlider.tag = 1700110032
            
            innerProgressSlider = UIImageView(frame: CGRect(x: self.center.x - 53, y: self.center.y + 56, width: 0, height: 2.0))
            innerProgressSlider.layer.cornerRadius = 1.0
            innerProgressSlider.backgroundColor = UIColor.lightGray
            innerProgressSlider.tag = 1700110035
            
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
            progressShapeLayer.name = "1700110036"
            
            //change the fill color
            progressShapeLayer.fillColor = UIColor.lightGray.cgColor
            //you can change the stroke color
            progressShapeLayer.strokeColor = UIColor.lightGray.cgColor
            //you can change the line width
            progressShapeLayer.lineWidth = 0.0
            
            ///progressCircle outer
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.center.x,y: self.center.y), radius: CGFloat(20), startAngle: CGFloat(-Double.pi * 0.5), endAngle:CGFloat(Double.pi * 1.5), clockwise: true)
            let progressShapeOuterLayer = CAShapeLayer()
            progressShapeOuterLayer.path = circlePath.cgPath
            progressShapeOuterLayer.name = "1700110037"
            progressShapeOuterLayer.fillColor = UIColor.clear.cgColor
            progressShapeOuterLayer.strokeColor = UIColor.lightGray.cgColor
            progressShapeOuterLayer.lineWidth = 1.0
            
            ///progressLabel
            titleLabel.text = title
            titleLabel.textColor = UIColor.white
            titleLabel.tag = 1700110033
            
            var isAdded = false
            for i in view.subviews {
                if let _ = i as? HyProgressHUB {
                    isAdded = true
                }
            }
            
            DispatchQueue.main.async {
                
                ///style setting
                switch self.style {
                case .shadowBackground:
                    self.addSubview(self.shadowImage!)
                case .blurBackground:
                    self.addSubview(self.blurEffectView!)
                case .clear:
                    break
                }
                
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
                    self.layer.addSublayer(progressShapeOuterLayer)
                }
                
                ///title for all type
                self.addSubview(self.titleLabel)
                
                ///customer setting
                if self.setProgressSlider {
                    self.addSubview(progressSlider)
                    self.addSubview(self.innerProgressSlider)
                }
                
                if self.setMidBlur {
                    self.addSubview(self.midBlurEffectView)
                }
                
                if !isAdded {
                    view.addSubview(self)
                }
            }
        }
    }
    
    private func setGif() {
        ///gif image
        if setLoadingGif != nil {
            progressImage.image = UIImage.gif(name: setLoadingGif!)
            progressImage.frame = CGRect(x: self.center.x - 40, y: self.center.y - 40, width: 80.0, height: 80.0)
            progressImage.tag = 1700110034
        } else {
            progressImage.image = UIImage.gif(name: "animat-pencil-color", bundle: Bundle(for: HyProgressHUB.self))
            progressImage.frame = CGRect(x: self.center.x - 40, y: self.center.y - 40, width: 80.0, height: 80.0)
            progressImage.tag = 1700110034
        }
    }
    
}
