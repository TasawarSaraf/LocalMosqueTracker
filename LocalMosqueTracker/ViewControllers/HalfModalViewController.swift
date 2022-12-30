//
//  HalfModalViewController.swift
//  LocalMosqueTracker
//
//  Created by Tasawar Saraf on 12/30/22.
//

import UIKit

class HalfModalPresentationController: UIPresentationController {

  private let margin: CGFloat

  init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?, margin: CGFloat) {
    self.margin = margin
    super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
  }

  override var frameOfPresentedViewInContainerView: CGRect {
    // Calculate the frame of the presented view controller
    // Set the height to half the height of the container view, with a margin of `self.margin` points
    // Set the width to the width of the container view
    // Set the origin to (0, containerView.bounds.height / 2)
      
      
      let frame = CGRect(x: 0, y: self.containerView!.frame.height / 2, width: self.containerView!.frame.width, height: self.containerView!.frame.height / 2 - margin)
    return frame
  }

}
