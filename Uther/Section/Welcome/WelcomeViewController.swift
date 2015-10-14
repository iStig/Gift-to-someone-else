//
//  WelcomeViewController.swift
//  Uther
//
//  Created by why on 8/8/15.
//  Copyright (c) 2015 callmewhy. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
  let transitionManager = WelcomeTransitionManager()
  
  @IBOutlet weak var shimmer: FBShimmeringView!
  @IBOutlet weak var avatar: UIImageView!
  @IBOutlet weak var starBackground: UIImageView!
  @IBOutlet var tapGesture: UITapGestureRecognizer!
  @IBOutlet var welcome: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: .Slide)
    UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: true)
    self.view.bringSubviewToFront(self.avatar)
    self.view.bringSubviewToFront(self.shimmer)
    self.setupShimmerView()
  }
  
  func setupShimmerView() {
    shimmer.contentView = welcome
    shimmer.shimmering = true
    shimmer.shimmeringPauseDuration = 0.4
    shimmer.shimmeringAnimationOpacity = 0.5
    shimmer.shimmeringOpacity = 0.3
    shimmer.shimmeringSpeed = 230
    shimmer.shimmeringHighlightLength = 1.0
    shimmer.shimmeringDirection = .Right
    shimmer.shimmeringBeginFadeDuration = 0.1
    shimmer.shimmeringEndFadeDuration = 0.3
    
  }
  
  @IBAction func `continue`(sender: AnyObject) {
    UIView.animateWithDuration(0.3, animations: {finish in
        self.avatar.hidden = false
    })
    self.performSegueWithIdentifier("show_main", sender: nil)
  }
  
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let toViewController = segue.destinationViewController
    toViewController.transitioningDelegate = self.transitionManager
    
    
  }
}
