//
//  HyProgressHubEnums.swift
//  HyProgressHUB
//
//  Created by HankTseng on 2018/8/1.
//  Copyright © 2018年 HyerTech. All rights reserved.
//

import Foundation



/// The progress indicator type
@objc public enum HyProgressType: Int {
    
    /// Little spinner just like UIActivityIndicator
    case simple
    
    /**
     Use customer gif for progress indicator.
          
     To set loading gif, you can use **hub.setLoadingGif =** `"`**loadingGif**`"`
     
     To set success gif, you can use **hub.setSuccesGif =** `"`**successGif**`"`
     
     To set fail gif, you can use **hub.setFailGif =** `"`**failGif**`"`
    */
    case gif
    
    /**
     Use customer Lottie file for progress indicator.
    
     To set loading Lottie, you can use **hub.setLoadingLottie = loadingLOTAnimationView**
     
     To set success Lottie, you can use **hub.setSuccesLottie = successLOTAnimationView**
     
     To set fail Lottie, you can use **hub.setFailLottie = failLOTAnimationView**
    */
    case lottie
    
    /// The dynamic circle like progress indicator.
    case progressCircle
}

/// The HUB background style.
@objc public enum HyProgressStyle: Int {
    /**
     The shadow black layer cover target view
     
     To set shadow color, you can use **hub.setBackgroundShadowColor = shadowColor**. (.black by default)
     
     To set shadow alpha, you can use **hub.setBackgroundShadowAlpha = shadowAlpha**. (0.7 by default)
     */
    case shadowBackground
    
    /**
     The blur effeck layer cover target view

     To set backgroundBlurStyle, you can use **hub.setBackgroundBlurStyle = blurEffectStyle**. (.dark by default)
     
     To set BackgroundBlurAlpha, you can use **hub.setBackgroundBlurAlpha = blurAlpha**. (1.0 by default)
     */
    case blurBackground
    
    /// Nothing cover target view
    case clear
}

/// Loading result.
@objc public enum DismissState: Int {
    case success
    case failure
}




