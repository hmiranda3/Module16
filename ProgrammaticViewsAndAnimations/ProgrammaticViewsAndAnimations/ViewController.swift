//
//  ViewController.swift
//  ProgrammaticViewsAndAnimations
//
//  Created by Habib Miranda on 5/30/16.
//  Copyright © 2016 littleJohns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let topLeftButton = UIButton()
    let topRightButton = UIButton()
    let bottomLeftButton = UIButton()
    let bottomRightButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupConstraints()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    func setupButtons() {
        
        // Set the Colors
        topLeftButton.backgroundColor = .greenColor()
        topRightButton.backgroundColor = .yellowColor()
        bottomLeftButton.backgroundColor = UIColor(red: 0.722, green: 0.322, blue: 0.227, alpha: 1.00)
        bottomRightButton.backgroundColor = UIColor(colorLiteralRed: 0.537, green: 0.506, blue: 0.925, alpha: 1.00)
        
        // Add targets for color animation
        topLeftButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        topRightButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        bottomLeftButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        bottomRightButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        
        
        //Add target for shake animation:
        topLeftButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), forControlEvents: .TouchDragExit)
        topRightButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), forControlEvents: .TouchDragExit)
        bottomLeftButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), forControlEvents: .TouchDragExit)
        bottomRightButton.addTarget(self, action: #selector(ViewController.buttonExited(_:)), forControlEvents: .TouchDragExit)

        
        
        // Add Butttons to the view
        view.addSubview(topLeftButton)
        view.addSubview(topRightButton)
        view.addSubview(bottomLeftButton)
        view.addSubview(bottomRightButton)
    
    }
    
    func buttonTapped() {
        let topLeftColor = topLeftButton.backgroundColor
        let topRightColor = topRightButton.backgroundColor
        let bottomLeftColor = bottomLeftButton.backgroundColor
        let bottomRightColor = bottomRightButton.backgroundColor
        
        UIView.animateWithDuration(1.0) { 
            self.topLeftButton.backgroundColor = bottomLeftColor
            self.topRightButton.backgroundColor = topLeftColor
            self.bottomRightButton.backgroundColor = topRightColor
            self.bottomLeftButton.backgroundColor = bottomRightColor
        }
    }
        

    func buttonExited(sender: UIButton) {
        view.bringSubviewToFront(sender)
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [sender.frame.origin.x + sender.frame.width / 2, sender.frame.origin.x + sender.frame.width / 2 - 15, sender.frame.origin.x + sender.frame.width / 2, sender.frame.origin.x + sender.frame.width / 2 + 15, sender.frame.origin.x + sender.frame.width / 2]
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.duration = 0.15
        animation.repeatCount = 5.0
        sender.layer.addAnimation(animation, forKey: "shake")
    }
    
    
    
    func setupConstraints() {
        
        topLeftButton.translatesAutoresizingMaskIntoConstraints = false
        topRightButton.translatesAutoresizingMaskIntoConstraints = false
        bottomRightButton.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Height and width
        
        let topButtonWidth = NSLayoutConstraint(item: topLeftButton, attribute: .Width, relatedBy: .Equal, toItem: topRightButton, attribute: .Width, multiplier: 1.0, constant: 0)
        let topButtonHeight = NSLayoutConstraint(item: topLeftButton, attribute: .Height, relatedBy: .Equal, toItem: topRightButton, attribute: .Height, multiplier: 1.0, constant: 0)
        let bottomButtonWidth = NSLayoutConstraint(item: bottomLeftButton, attribute: .Width, relatedBy: .Equal, toItem: bottomRightButton, attribute: .Width, multiplier: 1.0, constant: 0)
        let bootomButtonHeight = NSLayoutConstraint(item: bottomLeftButton, attribute: .Height, relatedBy: .Equal, toItem: topLeftButton, attribute: .Height, multiplier: 1.0, constant: 0)
        
        view.addConstraints([topButtonWidth, topButtonHeight, bottomButtonWidth, bootomButtonHeight])
        
        
        // Set Top and leading constraints:
        
        let topLeftLeadingConstraints = NSLayoutConstraint(item: topLeftButton, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        let topLeftTopConstraint = NSLayoutConstraint(item: topLeftButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0)
        
        
        //Top Left set trailing to topRightLeading:
        
        let topLeftToRopRightConstraint = NSLayoutConstraint(item: topLeftButton, attribute: .Trailing, relatedBy: .Equal, toItem: topRightButton, attribute: .Leading, multiplier: 1.0, constant: 0)
        
        
        //Top Left Bottom constraint:
        
        let topLeftBottomToBottomLeftTop = NSLayoutConstraint(item: topLeftButton, attribute: .Bottom, relatedBy: .Equal, toItem: bottomLeftButton, attribute: .Top, multiplier: 1.0, constant: 0)
        
        
        // TopRight Top and Trailing
        
        let topRightTopConstraint = NSLayoutConstraint(item: topRightButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0)
         let topRightTrailingConstraint = NSLayoutConstraint(item: topRightButton, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        
        //BottomLeft Leading and Bottom:
        
        let bottomLeftLeadingConstraint = NSLayoutConstraint(item: bottomLeftButton, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        let bottomLeftBottomConstraint = NSLayoutConstraint(item: bottomLeftButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        
        //bottomLeft trailing to bottom left left leading
        
        let bottomLeftTrailingToBottomRightLeadingConstraint = NSLayoutConstraint(item: bottomLeftButton, attribute: .Trailing, relatedBy: .Equal, toItem: bottomRightButton, attribute: .Leading, multiplier: 1.0, constant: 0)
        
        
        // topRightBottom to BottomRight Top
        
        let topRightBottomToBottomRightTopConstraint = NSLayoutConstraint(item: topRightButton, attribute: .Bottom, relatedBy: .Equal, toItem: bottomRightButton, attribute: .Top, multiplier: 1.0, constant: 0)
        
        //ButtomRight leading and bottom Contraints
        
        let bottomRightBottomConstraint = NSLayoutConstraint(item: bottomRightButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let bottomRightTrailingConstraint = NSLayoutConstraint(item: bottomRightButton, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        view.addConstraints([topLeftLeadingConstraints, topLeftToRopRightConstraint, topLeftBottomToBottomLeftTop, topRightTopConstraint, bottomLeftLeadingConstraint, bottomLeftBottomConstraint, bottomLeftTrailingToBottomRightLeadingConstraint, topRightBottomToBottomRightTopConstraint, bottomRightBottomConstraint,bottomRightTrailingConstraint, topLeftTopConstraint, topRightTrailingConstraint])


    }
    
}














