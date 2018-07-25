//
//  HyProgressHub+ShowProgress.swift
//  SuperHelper
//
//  Created by HankTseng on 2018/7/24.
//  Copyright © 2018年 andr. All rights reserved.
//

import UIKit

extension HyProgressHUB {
    
    
    
    @objc public func show(in view: UIView?, title: String? = "", isUserInteractionEnabled: Bool = false) {
        if let `view` = view {
            view.isUserInteractionEnabled = isUserInteractionEnabled
            
            let blurEffect = UIBlurEffect(style: backgroundBlurStyle)
            blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView?.frame = view.bounds
            blurEffectView?.tag = 1700110032
            blurEffectView?.alpha = backgroundBlurAlpha
            
            shadowImage = UIImageView(frame: view.frame)
            shadowImage?.tag = 1700110032
            shadowImage?.backgroundColor = UIColor.black.withAlphaComponent(setBackgroundShadowAlpha)
            
            littleSpinner.center = view.center
            littleSpinner.startAnimating()
            littleSpinner.tag = 1700110032
            
            midBlurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: setMidBlurStyle))
            midBlurEffectView.frame = CGRect(x: view.center.x - 60, y: view.center.y - 60, width: 120.0, height: 120.0)
            midBlurEffectView.tag = 1700110032
            midBlurEffectView.clipsToBounds = true
            midBlurEffectView.layer.cornerRadius = 12
            midBlurEffectView.alpha = self.setMidBlurAlpha
            
            ///gif image
            var progressImage = UIImageView()
            if setLoadingGif != nil {
                progressImage.image = UIImage.gif(name: setLoadingGif!)
                progressImage.frame = CGRect(x: view.center.x - 40, y: view.center.y - 40, width: 80.0, height: 80.0)
                progressImage.tag = 1700110034
            } else {
                
                progressImage.image = UIImage.gif(name: "animat-pencil-color", bundle: Bundle(for: HyProgressHUB.self))
                print("framework HyProgressHUB.self")
                print(HyProgressHUB.self)
                progressImage.frame = CGRect(x: view.center.x - 40, y: view.center.y - 40, width: 80.0, height: 80.0)
                progressImage.tag = 1700110034
            }
            
            ///title
            let titleLabel = UILabel(frame: CGRect(x: view.center.x - 56, y: view.center.y + 18, width: 112, height: 44.0))
            titleLabel.minimumScaleFactor = 0.5
            titleLabel.adjustsFontSizeToFitWidth = true
            titleLabel.textAlignment = .center
            self.title = title
            
            ///progressSlider
            let progressSlider = UIImageView(frame: CGRect(x: view.center.x - 53, y: view.center.y + 56, width: 106, height: 2.0))
            progressSlider.layer.cornerRadius = 3.0
            progressSlider.backgroundColor = UIColor.darkGray
            progressSlider.tag = 1700110032
            
            let innerProgressSlider = UIImageView(frame: CGRect(x: view.center.x - 53, y: view.center.y + 56, width: 0, height: 2.0))
            innerProgressSlider.layer.cornerRadius = 1.0
            innerProgressSlider.backgroundColor = UIColor.lightGray
            innerProgressSlider.tag = 1700110035
            
            ///progressCircle inner
            let center = CGPoint(x: view.center.x, y: view.center.y)
            let radius = CGFloat(20)
            let startAngle = CGFloat(-Double.pi * 0.5)
            let endAngle = CGFloat(Double.pi * 0 - Double.pi * 0.5)
            let path = UIBezierPath()
            path.move(to: center)
            path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            path.close()
            
            let progressShapeLayer = CAShapeLayer()
            progressShapeLayer.path = path.cgPath
            progressShapeLayer.name = "1700110036"
            
            //change the fill color
            progressShapeLayer.fillColor = UIColor.lightGray.cgColor
            //you can change the stroke color
            progressShapeLayer.strokeColor = UIColor.lightGray.cgColor
            //you can change the line width
            progressShapeLayer.lineWidth = 0.0
            
            
            ///progressCircle outer
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: view.center.x,y: view.center.y), radius: CGFloat(20), startAngle: CGFloat(-Double.pi * 0.5), endAngle:CGFloat(Double.pi * 1.5), clockwise: true)
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
                if i.tag == 1700110032 || i.tag == 1700110033 || i.tag == 1700110034 || i.tag == 1700110035 || i.tag == 1700110036{
                    isAdded = true
                }
            }
            
            if !isAdded {
                DispatchQueue.main.async {
                    
                    
                    ///style setting
                    switch self.style {
                    case .shadowBackground:
                        view.addSubview(self.shadowImage!)
                    case .blurBackground:
                        view.addSubview(self.blurEffectView!)
                    case .clear:
                        break
                    }
                    
                    ///type setting
                    switch self.type {
                    case .simple:
                        view.addSubview(self.littleSpinner)
                    case .gif:
                        view.addSubview(progressImage)
                    case .progressCircle:
                        self.showCircleProgressIndicator = true
                        view.layer.addSublayer(progressShapeLayer)
                        view.layer.addSublayer(progressShapeOuterLayer)
                    }
                    
                    ///title for all type
                    view.addSubview(titleLabel)
                    
                    ///customer setting
                    if self.setProgressSlider {
                        view.addSubview(progressSlider)
                        view.addSubview(innerProgressSlider)
                    }
                    
                    if self.setMidBlur {
                        view.addSubview(self.midBlurEffectView)
                    }
                    
                }
            }
        }
    }
}
