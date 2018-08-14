HyProgressHUB
====
Nice progress hub support gif animation and Lottie.

Overview
----
The light weight animation progress hub is here: HyProgressHUB!!!
* Highly customized
* Easy to use
* Support Gif animation
* Support Lottie animation

Example
----
Swift:

    let hub = HyProgressHUB.init(type: .gif, style: .blurBackground)
    hub.setLoadingGif = "yourGif"
    hub.show(in: self.view)
    
Set progress:

    hub.setProgressPersent(in: self.view, persent: 0.87)
    
Dismiss

    hub.dismiss(in: self.view)
      
That's all, isn't easy?

Installation
----
### CocoaPods: 
In your Podfile add:
  
    pod 'HyProgressHUB'
    
### Carthage:
In your Cartfile add:

    github "bbkaf/HyProgressHUB"
    
