//
//  HyProgressHub.swift
//  SuperHelper
//
//  Created by HankTseng on 2018/7/15.
//  Copyright © 2018年 Hyer bbkaf. All rights reserved.
//

import UIKit

/**
 The elegent HUB for iOS: **HyProgressHUB**
 
 - Gif supported
 - Lottie supported
 - Progress indicator supported
 - highly customized
 
 */
public class HyProgressHUB: UIView {
    
    /**
     Init HyProgressHUB with indicator type and background style.
     - parameter type: The progress indicator type.
     - parameter style: The HUB background style.
     */
    public init(type: HyProgressType, style: HyProgressStyle) {
        let tempFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
        super.init(frame: tempFrame)
        self.style = style
        self.type = type
    }
    
    ///Do not implemented this methode.
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     * Determine whether to show progress persent (%) in the end of content label.
     *
     * To show progress persent, you can set hub.setProgressLabel = true.
     *
     * Default: false.
     */
    public var setProgressLabel: Bool = false
    
    /// Determine whether to show horizantal progress indicator slider bar at the buttom of Hub.
    public var setProgressSlider: Bool = false
    
    /// Set title color. (.white by default)
    public var setTitleColor: UIColor = .white
    
    /// Set gif image for loading.
    public var setLoadingGif: String? = nil
    
    /// Set gif image for loading success.
    public var setSuccessGif: String? = nil
    
    /// Set gif image for error situation.
    public var setFailureGif: String? = nil
    
    /// Set shadow color for HyProgressStyle.shadowBackground. (.black by default)
    public var setBackgroundShadowColor: UIColor = .black
    
    /// Set shadow alpha for HyProgressStyle.shadowBackground. (0.7 by default)
    public var setBackgroundShadowAlpha: CGFloat = 0.7
    
    /// Set the width of BlurEffectArea in the center of HUB. (120.0 by default)
    public var setMidAreaWidth: CGFloat = 120.0
    
    /// Set the height of BlurEffectArea in the center of HUB. (120.0 by default)
    public var setMidAreaHeight: CGFloat = 120.0
    
    ///Determine whether to show BlurEffectArea in the center of HUB. (false by default)
    public var setMidBlur: Bool = false
    
    /// Determine the UIBlurEffectStyle for BlurEffectArea. (.light by default)
    public var setMidBlurStyle: UIBlurEffectStyle = .light
    
    /// Set alpha for BlurEffectArea. (0.9 by default)
    public var setMidBlurAlpha: CGFloat = 0.9
    
    /// Cool feature, Just try it. (false by default)
    public var setDynamicBackgroundAlpha: Bool = false
    
    /// Set lottie animation for loading, you know lottie right? put LOTAnimationView for loading in here.
    public var setLoadingLottie: UIView? = nil
    
    /// Set lottie animation for success, you know lottie right? put LOTAnimationView for success in here.
    public var setSuccessLottie: UIView? = nil
    
    /// Set lottie animation for error, you know lottie right? put LOTAnimationView for error in here.
    public var setFailLottie: UIView? = nil
    
    /// Set the indicator icon width, e.g. lottie, gif, progress. (80.0 by default)
    public var setIconWidth: CGFloat = 80.0
    
    /// Set the indicator icon height, e.g. lottie, gif, progress. (80.0 by default)
    public var setIconHeight: CGFloat = 80.0
    
    
    
    
    /// Set blurEffect style for HyProgressStyle.blurBackground. (.dark by default)
    public var setBackgroundBlurStyle: UIBlurEffectStyle = .dark
    
    /// Set blurEffect alpha for HyProgressStyle.blurBackground. (1.0 by default)
    public var setBackgroundBlurAlpha: CGFloat = 1.0
    
    //internal property
    internal var type: HyProgressType = .simple
    internal var style: HyProgressStyle = .shadowBackground
    internal var blurEffectView: UIVisualEffectView?
    internal var shadowImage: UIImageView?
    internal var midDialog: UIImageView?
    internal var title: String?
    internal var disableUserInteraction: Bool = true
    
    internal var littleSpinner = UIActivityIndicatorView(activityIndicatorStyle: .white)
    internal var midBlurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    internal var showCircleProgressIndicator = false
    internal var lottieAnimationView: UIView? = nil
    internal var targetView: UIView? = nil
    internal var progressImage = UIImageView()
    internal var titleLabel = UILabel()
    internal var innerProgressSlider = UIImageView()
    internal var progressShapeLayer = CAShapeLayer()
    internal var progressShapeOuterLayer = CAShapeLayer()
    internal var progressSlider = UIImageView()
    
    internal var setProgressSliderHeight: CGFloat = 2.0
    internal var setProgressSliderWidth: CGFloat {
        return setMidAreaWidth - 14
    }
    internal var setTitleWidth: CGFloat {
        return setMidAreaWidth - 8
    }

}


