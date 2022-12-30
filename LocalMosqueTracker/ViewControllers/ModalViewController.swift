//
//  ModalViewController.swift
//  LocalMosqueTracker
//
//  Created by Tasawar Saraf on 12/30/22.
//

import UIKit

class ModalViewController: UIViewController, UIViewControllerTransitioningDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()

    // Set the transitioning delegate to self
    transitioningDelegate = self

    // Set the modal presentation style to .custom
    modalPresentationStyle = .custom
  }

  // MARK: - UIViewControllerTransitioningDelegate

  func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    // Return a custom presentation controller that sets the frame of the presented view controller to half the height of the screen, with a margin of 16 points
    return HalfModalPresentationController(presentedViewController: presented, presenting: presenting, margin: 16)
  }
    
    
    
// MARK: HalfModalAnimationController is responsible 

  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    // Return a custom animation controller that slides the presented view controller in from the bottom of the screen
    return HalfModalAnimationController(type: .present)
  }

  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    // Return a custom animation controller that slides the presented view controller out to the bottom of the screen
    return HalfModalAnimationController(type: .dismiss)
  }

}

