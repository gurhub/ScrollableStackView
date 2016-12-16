//
//  ViewController.swift
//  ScrollableStackView
//
//  Created by Gürhan Yerlikaya on 12/15/2016.
//  Copyright (c) 2016 Gürhan Yerlikaya. All rights reserved.
//

import UIKit
import ScrollableStackView

class ViewController: UIViewController {

    var didSetupConstraints = false
    var scrollable: ScrollableStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollable = ScrollableStackView(frame: view.frame)
        view.addSubview(scrollable)
        
        for _ in 1 ..< 11 {
            let random = CGFloat(arc4random_uniform(131) + 30) // between 30-130
            let rectangle = UIView(frame: CGRect(x: 0, y: 0, width: 42, height: 42))
            rectangle.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
            rectangle.heightAnchor.constraint(equalToConstant: random).isActive = true
            scrollable.stackView.addArrangedSubview(rectangle)
        }
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            
            let views:[String: AnyObject] = ["scrollableStackView": scrollable]
            
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollableStackView]|", options: .alignAllCenterX, metrics: nil, views: views))
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollableStackView]|", options: .alignAllCenterX, metrics: nil, views: views))
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
