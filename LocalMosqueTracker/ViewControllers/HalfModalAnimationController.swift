//
//  HalfModalAnimationController.swift
//  LocalMosqueTracker
//
//  Created by Tasawar Saraf on 12/30/22.
//

import UIKit

enum TransitionType {
  case present
  case dismiss
}

class HalfModalAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

  private let type: TransitionType

  init(type: TransitionType) {
    self.type = type
  }

  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.5
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView
    let toViewController = transitionContext.viewController(forKey: .to)!
    let fromViewController = transitionContext.viewController(forKey: .from)!

    let isPresenting = type == .present

    if isPresenting {
      containerView.addSubview(toViewController.view)
    }

    let animationDuration = transitionDuration(using: transitionContext)

    UIView.animate(withDuration: animationDuration, animations: {
      if isPresenting {
        // Animate the presented view controller sliding in from the bottom
        toViewController.view.frame.origin.y = 0
      } else {
        // Animate the presented view controller sliding out to the bottom
        fromViewController.view.frame.origin.y = containerView.bounds.height
      }
    }, completion: { _ in
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    })
  }

}
