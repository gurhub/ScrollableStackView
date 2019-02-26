# ScrollableStackView

Scrollable UIStackView. Scroll your stack view with a smile up on your face. Written in Swift 3. Used Apple's pure auto layout. If you need to use UIStackView scrollable (like UIScrollView) this is the right library for you. Objective-C and Swift compatible.

<!---->
<!--[![CI Status](http://img.shields.io/travis/Gürhan Yerlikaya/ScrollableStackView.svg?style=flat)](https://travis-ci.org/Gürhan Yerlikaya/ScrollableStackView)-->

[![Version](https://img.shields.io/cocoapods/v/ScrollableStackView.svg?style=flat)](http://cocoapods.org/pods/ScrollableStackView)
[![License](https://img.shields.io/cocoapods/l/ScrollableStackView.svg?style=flat)](http://cocoapods.org/pods/ScrollableStackView)
[![Platform](https://img.shields.io/cocoapods/p/ScrollableStackView.svg?style=flat)](http://cocoapods.org/pods/ScrollableStackView)

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for both Swift and Objective-C. ScrollableStackView is available through CocoaPods. You can install it with the following command:

```bash
$ gem install cocoapods
```

#### Podfile

To install it, simply add the following line to your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'

target 'TargetName' do
    pod "ScrollableStackView"
end
```
Then, run the following command:

```bash
$ pod install
```

#### Test Drive | Try Now 🚀

You can try library before you add it to your project 🎯 Give it a try:    

```bash
$ pod try ScrollableStackView
```

Pod try is a wonderful subcommand which allows you to quickly launch the demo project of a Pod. It can be used to assess the quality of a library – very useful for user interface elements – or to quickly get up to speed on how to use it.

## Usage
### Sample Code (Swift)

```swift
import ScrollableStackView

var scrollable = ScrollableStackView(frame: view.frame)
view.addSubview(scrollable)

// add your views with
let rectangle = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 55))
rectangle.backgroundColor = UIColor.blue
scrollable.stackView.addArrangedSubview(rectangle)
// ...

// you can set margins directly on the stackview
scrollable.stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
scrollable.stackView.isLayoutMarginsRelativeArrangement = true

```

### Sample Code (Objective-C)

```objective-c
@import ScrollableStackView

ScrollableStackView *scrollable = [[ScrollableStackView alloc] initWithFrame:self.view.frame];
scrollable.stackView.distribution = UIStackViewDistributionFillProportionally;
scrollable.stackView.alignment = UIStackViewAlignmentCenter;
scrollable.stackView.axis = UILayoutConstraintAxisVertical;
[self.view addSubview:scrollable];

UIView *rectangle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 55)];
[rectangle setBackgroundColor:[UIColor blueColor]];

// add your views with
[scrollable.stackView addArrangedSubview:rectangle];
// ...
```

## Example Project

Cocoapods
To run the example project, clone the repo, and run

```bash
$ pod install
```

from the Example directory first.    

<!--## Code Snippets-->
<!--## Wish List -->
<!--## Requirements-->


## Communication

If you see a way to improve the project :

- If you **need help**, use [Stack Overflow](https://stackoverflow.com/questions/tagged/scrollablestackview). (Tag `scrollablestackview`)
- If you'd like to **ask a general question**, use [Stack Overflow](https://stackoverflow.com/questions/tagged/scrollablestackview).
- If you **found a bug**, _and can provide steps to reliably reproduce it_, open an [issue][].
- If you **have a feature request**, open an [issue][].
- If you **want to contribute**, submit a [pull request]. It's better to begin with an [issue][] rather than a [pull request], though, because we might disagree whether the proposed change is an actual improvement. :wink:

Recommend following [GitHub Swift Style Guide][]

Thanks! :v:

[issue]: https://github.com/gurhub/ScrollableStackView/issues
[pull request]: https://github.com/gurhub/ScrollableStackView/pulls
[GitHub Swift Style Guide]: https://github.com/github/swift-style-guide

### TODO

- [ ] Add Storyboard in example project
- [ ] Add toolbar for example project (or UITableView)
- [ ] Add Carthage support
- [ ] Add Swift Package Manager support

## Author

Gürhan Yerlikaya, gurhanyerlikaya@gmail.com

## License

ScrollableStackView is available under the MIT license. See the [`LICENSE`](LICENSE) file for more info.
