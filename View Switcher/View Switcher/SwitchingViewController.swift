//
//  SwitchingViewController.swift
//  View Switcher
//
//  Created by Mashiro on 15/12/11.
//  Copyright © 2015年 Mashiro. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    private var firstViewController: FirstViewController!
    private var secondViewController: SecondViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        firstViewController = storyboard?.instantiateViewControllerWithIdentifier("First") as! FirstViewController
        firstViewController.view.frame = view.frame
        switchViewController(from: nil, to: firstViewController)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        // 故意没加 '?'
        if secondViewController?.view.superview == nil {
            if secondViewController == nil {
                secondViewController = storyboard?.instantiateViewControllerWithIdentifier("Second") as! SecondViewController
            }
        } else if firstViewController?.view.superview == nil {
            if firstViewController == nil {
                firstViewController = storyboard?.instantiateViewControllerWithIdentifier("First") as! FirstViewController
            }
        }
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationCurve(.EaseInOut)
        
        if firstViewController != nil && firstViewController.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            secondViewController.view.frame = view.frame
            switchViewController(from: firstViewController, to: secondViewController)
        } else {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            firstViewController.view.frame = view.frame
            switchViewController(from: secondViewController, to: firstViewController)
        }
        UIView.commitAnimations()
    }
    
    private func switchViewController(from fromVC:UIViewController?, to toVC:UIViewController?) {
        if fromVC != nil {
            fromVC!.willMoveToParentViewController(nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.didMoveToParentViewController(self)
        }
        
        if toVC != nil {
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, atIndex: 0)
            toVC!.didMoveToParentViewController(self)
        }
    }
}
