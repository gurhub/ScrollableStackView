Pod::Spec.new do |s|
s.name             = 'ScrollableStackView'
s.version          = '1.0.3'
s.summary          = 'Scrollable UIStackView. Scroll your stack view with a smile up on your face. Written in Swift 3. Used Apple s pure auto layout.'
s.description      = <<-DESC

Scrollable UIStackView. Scroll your stack view with a smile up on your face. Written in Swift 3. Used Apple s pure auto layout. If you need to use UIStackView scrollable (like UIScrollView) this is the right library for you. Objective-C and Swift compatible!

DESC

s.homepage         = 'https://github.com/gurhub/ScrollableStackView'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Gürhan Yerlikaya' => 'gurhanyerlikaya@gmail.com' }
s.source           = { :git => 'https://github.com/gurhub/ScrollableStackView.git', :tag => s.version.to_s }
s.ios.deployment_target = '10.0'
s.source_files = 'ScrollableStackView/Classes/**/*'
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.1.0' }
end
