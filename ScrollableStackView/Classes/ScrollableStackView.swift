// MIT license. Copyright (c) 2017 Gürhan Yerlikaya. All rights reserved.
import UIKit

@IBDesignable
public class ScrollableStackView: UIView {
    
    fileprivate var didSetupConstraints = false
    @IBInspectable open var spacing: CGFloat = 8
    open var durationForAnimations:TimeInterval = 1.45
	
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
    public func scrollToItem(index: Int) {
        if stackView.arrangedSubviews.count > 0 {
            let view = stackView.arrangedSubviews[index]
            
            UIView.animate(withDuration: durationForAnimations, animations: {
                self.scrollView.setContentOffset(CGPoint(x: 0, y:view.frame.origin.y), animated: true)
            })
        }
    }
    
    // Used to scroll till the end of scrollview
    public func scrollToBottom() {
        if stackView.arrangedSubviews.count > 0 {
            UIView.animate(withDuration: durationForAnimations, animations: {
                self.scrollView.scrollToBottom(true)
            })
        }
    }
    
    // Scrolls to top of scrollable area
    public func scrollToTop() {
        if stackView.arrangedSubviews.count > 0 {
            UIView.animate(withDuration: durationForAnimations, animations: {
                self.scrollView.setContentOffset(CGPoint(x: 0, y:0), animated: true)
            })
        }
    }
    
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
