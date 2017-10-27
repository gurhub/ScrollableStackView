// MIT license. Copyright (c) 2017 Gürhan Yerlikaya. All rights reserved.
import UIKit

@IBDesignable
@objc public class ScrollableStackView: UIView {
    
    fileprivate var didSetupConstraints = false
    @objc @IBInspectable open var spacing: CGFloat = 8
    @objc open var durationForAnimations:TimeInterval = 1.45
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
	public lazy var scrollView: UIScrollView = {
		let instance = UIScrollView(frame: CGRect.zero)
		instance.translatesAutoresizingMaskIntoConstraints = false
		instance.layoutMargins = .zero
		return instance
	}()

	public lazy var stackView: UIStackView = {
		let instance = UIStackView(frame: CGRect.zero)
		instance.translatesAutoresizingMaskIntoConstraints = false
		instance.axis = .vertical
		instance.spacing = self.spacing
		instance.distribution = .equalSpacing
		return instance
	}()

    //MARK: View life cycle
    override public func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        setupUI()
    }
    
    //MARK: UI
    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true

		addSubview(scrollView)
		scrollView.addSubview(stackView)

        setNeedsUpdateConstraints() // Bootstrap auto layout
    }
    
    // Scrolls to item at index
    @objc public func scrollToItem(index: Int) {
        if stackView.arrangedSubviews.count > 0 {
            let view = stackView.arrangedSubviews[index]
            
            UIView.animate(withDuration: durationForAnimations, animations: {
                self.scrollView.setContentOffset(CGPoint(x: 0, y:view.frame.origin.y), animated: true)
            })
        }
    }
    
    // Used to scroll till the end of scrollview
    @objc public func scrollToBottom() {
        if stackView.arrangedSubviews.count > 0 {
            UIView.animate(withDuration: durationForAnimations, animations: {
                self.scrollView.scrollToBottom(true)
            })
        }
    }
    
    // Scrolls to top of scrollable area
    @objc public func scrollToTop() {
        if stackView.arrangedSubviews.count > 0 {
            UIView.animate(withDuration: durationForAnimations, animations: {
                self.scrollView.setContentOffset(CGPoint(x: 0, y:0), animated: true)
            })
        }
    }
    
    func addItemToStack() {
        let random = CGFloat(arc4random_uniform(131) + 30) // between 30-130
        let rectangle = UIView(frame: CGRect(x: 0, y: 0, width: random, height: random))
        rectangle.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
        rectangle.heightAnchor.constraint(equalToConstant: random).isActive = true
        
        UIView.animate(withDuration: 0.25, animations: {
            self.stackView.addArrangedSubview(rectangle)
        }) { (isDone) in
            if(isDone) {
                self.scrollView.scrollToBottom(true)
            }
        }
    }
    
    func removeItemFromStack() {
        UIView.animate(withDuration: 0.25, animations: {
            if let last = self.stackView.arrangedSubviews.last {
                self.stackView.removeArrangedSubview(last)
            }
        }) { (isDone) in
            if(isDone) {
                self.scrollView.scrollToBottom(true)
            }
        }
    }
    
    // Auto Layout
    override public func updateConstraints() {
        super.updateConstraints()
        
        if !didSetupConstraints {
			scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
			scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
			scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
			scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

			stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
			stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
			stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
			stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
			
			// Set the width of the stack view to the width of the scroll view for vertical scrolling
			stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
			
            didSetupConstraints = true
        }
    }
}

// Used to scroll till the end of scrollview
extension UIScrollView {
    func scrollToBottom(_ animated: Bool) {
        if self.contentSize.height < self.bounds.size.height { return }
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: animated)
    }
}
