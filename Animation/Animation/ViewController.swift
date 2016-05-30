//
//  ViewController.swift
//  Animation
//
//  Created by Habib Miranda on 5/29/16.
//  Copyright © 2016 littleJohns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var yConstraint: NSLayoutConstraint?
    var drawerShown = false

    override func viewDidLoad() {
        super.viewDidLoad()
        let yImageView = UIImageView(frame: CGRectMake(200, 300, 1, 1))
        yImageView.image = UIImage(named: "letter-y")
        self.view.addSubview(yImageView)
        
        yImageView.alpha = 0.5
        
        let rotationTransform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        
        //This scales the image to however many times larger or smaller than what we set it to originally.
        let scaleTransform = CGAffineTransformMakeScale(300, 300)
        
        
        UIView.animateWithDuration(4) { void in
            yImageView.alpha = 1.0
            yImageView.center = CGPoint(x: yImageView.center.x, y: yImageView.center.y - 100)
            //For some reason, using the commented code instead of concat makes the y rotate 360 degrees.
            yImageView.transform = rotationTransform
            yImageView.transform = scaleTransform
//            yImageView.transform = CGAffineTransformConcat(rotationTransform, scaleTransform)
        }
        
        // HEre we will use basic animation:
        let movingYImageView = UIImageView(frame: CGRectMake(0, 400, 75, 75))
        movingYImageView.image = UIImage(named: "letter-y")
        view.addSubview(movingYImageView)
        
        let basicAnimation = CABasicAnimation()
        basicAnimation.keyPath = "position.x"
        basicAnimation.fromValue = movingYImageView.center.x
        basicAnimation.toValue = movingYImageView.center.x + 339
        basicAnimation.duration = 4
        
        movingYImageView.layer.addAnimation(basicAnimation, forKey: "move")
        movingYImageView.center.x += 339
        
        let shakingYImageView = UIImageView(frame: CGRectMake(175, 600, 75, 75))
        shakingYImageView.image = UIImage(named: "letter-y")
        view.addSubview(shakingYImageView)

        let shakeAnimation = CAKeyframeAnimation()
        shakeAnimation.keyPath = "position.x"
        shakeAnimation.values = [0, 10, -10, 10, 0]
        shakeAnimation.keyTimes = [0, 1/6.0, 3/6.0, 5/6.0, 1.0]
        shakeAnimation.duration = 1.0
        shakeAnimation.additive = true
        shakingYImageView.layer.addAnimation(shakeAnimation, forKey: "shake")
        
        let yPerimeterImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        yPerimeterImageView.image = UIImage(named: "letter-y")
        view.addSubview(yPerimeterImageView)
        
        let aroundScreen = CAKeyframeAnimation()
        aroundScreen.keyPath = "position"
        aroundScreen.path = CGPathCreateWithRect(CGRect(x:  25, y: 25, width: view.frame.width - 50, height: view.frame.height - 50), nil)
        aroundScreen.duration = 4
        aroundScreen.repeatCount = 1
        aroundScreen.calculationMode = kCAAnimationPaced
        aroundScreen.rotationMode = kCAAnimationRotateAuto
        
        yPerimeterImageView.layer.addAnimation(aroundScreen, forKey: "around")
        
        let drawerView = UITextField()
        drawerView.borderStyle = .RoundedRect
        drawerView.borderStyle = .Line
        drawerView.backgroundColor = .grayColor()
        drawerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(drawerView)
        
        let xConstraint = NSLayoutConstraint(item: drawerView, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1.0, constant: 0)
        view.addConstraint(xConstraint)
        
        let yConstraint = NSLayoutConstraint(item: drawerView, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -80)
        view.addConstraint(yConstraint)
        
        let heightConstraint = NSLayoutConstraint(item: drawerView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 80)
        view.addConstraint(heightConstraint)
        
        let widthConstraint = NSLayoutConstraint(item: drawerView, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(widthConstraint)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


























