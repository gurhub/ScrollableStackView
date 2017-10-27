// MIT license. Copyright (c) 2017 Gürhan Yerlikaya. All rights reserved.
import UIKit
import ScrollableStackView

class VerticalLayoutViewController: UIViewController {

    var didSetupConstraints = false
    var scrollable: ScrollableStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollable = ScrollableStackView(frame: view.frame)
        scrollable.stackView.distribution = .fillProportionally
        scrollable.stackView.alignment = .center
        scrollable.stackView.axis = .vertical
        scrollable.scrollView.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        view.addSubview(scrollable)
        
        for _ in 1 ..< 23 {
            let min:UInt32 = 30
            let max:UInt32 = 400
            let random = CGFloat(arc4random_uniform(max - min) + min) // between 30-130
            let rectangle = UIView(frame: CGRect(x: 0, y: 0, width: random, height: random))
            rectangle.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
            rectangle.heightAnchor.constraint(equalToConstant: random).isActive = true
            rectangle.widthAnchor.constraint(equalToConstant: random).isActive = true
            scrollable.stackView.addArrangedSubview(rectangle)
        }
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 45))
        label.numberOfLines = 0
        label.text = "Build with Xcode 8 and the latest SDKs. Xcode 8 includes Swift 3 and the latest SDKs for all Apple platforms. If your app is written in Swift, you can submit your apps to the App Store written in either Swift 3.0 or 2.3. We strongly encourage you to migrate your code to Swift 3. However, if you need to first update your code to Swift 2.3, you can run the Xcode 8 migrator later to move from 2.3 to 3.0. Before finalizing your app for release to the general public, get valuable feedback with beta testing to make sure it’s ready for your customers. TestFlight makes it easy to invite users to beta test your apps directly on their iPhone, iPad, Apple Watch, and Apple TV."
        
        label.sizeToFit()
        scrollable.stackView.addArrangedSubview(label)
        
        view.setNeedsUpdateConstraints()
        
        self.perform(#selector(jumpToView), with: nil, afterDelay: 3.0)
    }
    
    func jumpToView() {
        scrollable.scrollToItem(index: 11)
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
