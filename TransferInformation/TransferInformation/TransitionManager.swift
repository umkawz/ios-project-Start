//
//  TransitionManager.swift
//  TransferInformation
//
//  Created by intern on 06/07/2017.
//  Copyright © 2017 intern. All rights reserved.
//

import UIKit

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    // MARK: методы протокола UIViewControllerAnimatedTransitioning
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
        
        let container = transitionContext.containerView
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        
        let offScreenRight = CGAffineTransform(translationX: container.frame.width, y: 0)
        let offScreenLeft = CGAffineTransform(translationX: -container.frame.width, y: 0)
        
        
        
        toView.transform = offScreenRight
        
        // add the both views to our view controller
        container.addSubview(toView)
        container.addSubview(fromView)
        
        let duration = self.transitionDuration(transitionContext)
        UIView.animateWithDuration(0.8, delay: 0.0, options: nil, animations: {
            
            fromView.transform = offScreenLeft
            toView.transform = CGAffineTransformIdentity
            
        }, completion: { finished in
            
            transitionContext.completeTransition(true)
            
        })
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    

}
