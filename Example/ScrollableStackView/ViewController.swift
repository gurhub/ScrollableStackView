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
    var scrollableStackView: ScrollableStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollableStackView = ScrollableStackView(frame: view.frame)
        view.addSubview(scrollableStackView)
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            
            let views:[String: AnyObject] = ["scrollableStackView": scrollableStackView]
            
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
