#
# Be sure to run `pod lib lint WYAKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WYAKit'
  s.version          = '0.1.36'
  s.summary          = 'WYAKit组件库'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/wya-team/WYAOCKit.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'WYATeam' => 'Lsh\Ljh' }
  s.source           = { :git => 'https://github.com/wya-team/WYAOCKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'WYAKit/Classes/**/*.{h,m,pch}'
  
  s.static_framework = true
  
  s.resource_bundles = {
     'WYAKit' => ['WYAKit/Assets/*.xcassets', 'WYAKit/Classes/WYAHardware/WYAPhotoBrowser/PhotoBrowser/resource/ZLPhotoBrowser.bundle'],
  }

  s.resources = "WYAKit/Assets/Pusab.ttf"
  
  s.frameworks = 'UIKit', 'ImageIO'
  
  s.prefix_header_file = 'WYAKit/Classes/WYAHelp/WYAKitConfigePrefix.pch'
  
  s.dependency 'Masonry'
  s.dependency 'FMDB'
  s.dependency 'JQFMDB'
  #s.dependency 'YYKit'
  s.dependency 'YYText'
  s.dependency 'YYImage'
  s.dependency 'YYModel'
  s.dependency 'SVGKit'
  s.dependency 'MJRefresh'
  s.dependency 'SDWebImage'
  s.dependency 'Realm'
  s.dependency 'AFNetworking'
  s.dependency 'NTYAmrConverter'
  s.dependency 'AliyunOSSiOS'
  s.dependency 'GPUImage'
  s.dependency 'SSKeychain'
  # 暂时未使用到的
  s.dependency 'Bugly'
  s.dependency 'YogaKit'
end
