Pod::Spec.new do |s|
s.name             = 'ScrollableStackView'
s.version          = '1.0.1'
s.summary          = 'Scrollable UIStackView. Scroll your stack view with a smile up on your face. Written in Swift 3. Used Apple s pure auto layout.'
s.description      = <<-DESC

Scrollable UIStackView. Scroll your stack view with a smile up on your face. Written in Swift 3. Used Apple s pure auto layout. If you need to use UIStackView scrollable (like UIScrollView) this is the right library for you. Also supports for Objective-C too!

DESC

s.homepage         = 'https://github.com/gurhub/ScrollableStackView'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Gürhan Yerlikaya' => 'gurhanyerlikaya@gmail.com' }
s.source           = { :git => 'https://github.com/gurhub/ScrollableStackView.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '9.0'

s.source_files = 'ScrollableStackView/Classes/**/*'

# s.resource_bundles = {
#   'ScrollableStackView' => ['ScrollableStackView/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'
# s.dependency 'AFNetworking', '~> 2.3'
end
