# ScrollableStackView

Scrollable UIStackView. Scroll your stack view with a smile up on your face. Written in Swift 3. Used Apple's pure auto layout. If you need to use UIStackView scrollable (like UIScrollView) this is the right library for you. Objective-C and Swift compatible.

<!---->
<!--[![CI Status](http://img.shields.io/travis/Gürhan Yerlikaya/ScrollableStackView.svg?style=flat)](https://travis-ci.org/Gürhan Yerlikaya/ScrollableStackView)-->

[![Version](https://img.shields.io/cocoapods/v/ScrollableStackView.svg?style=flat)](http://cocoapods.org/pods/ScrollableStackView)
[![License](https://img.shields.io/cocoapods/l/ScrollableStackView.svg?style=flat)](http://cocoapods.org/pods/ScrollableStackView)
[![Platform](https://img.shields.io/cocoapods/p/ScrollableStackView.svg?style=flat)](http://cocoapods.org/pods/ScrollableStackView)

### TODO

- [ ] Add Storyboard in example project  
- [ ] Try NSLayoutAnchor style (requires iOS 9 and later)
- [ ] Add Carthage support
- [ ] Add Swift Package Manager support

## Example

Cocoapods
To run the example project, clone the repo, and run `pod install` from the Example directory first.   

## Usage
### Sample Code (Swift)

```swift
var scrollable = ScrollableStackView(frame: view.frame)
view.addSubview(scrollable)

// add your views with addArrangedSubview(your_view) 
let rectangle = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 55))
rectangle.backgroundColor = UIColor.red
scrollable.stackView.addArrangedSubview(rectangle)
```

### Sample Code (Objective-C)

```objective-c

```


## Wish List 

## Requirements

## Installation

ScrollableStackView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ScrollableStackView"
```

## Author

Gürhan Yerlikaya, gurhanyerlikaya@gmail.com

## License

ScrollableStackView is available under the MIT license. See the [`LICENSE`](LICENSE) file for more info.
