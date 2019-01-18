#
# Be sure to run `pod lib lint WYAKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WYAKit'
  s.version          = '0.1.0.1'
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

  # s.source_files = 'WYAKit/Classes/**/*'
  
  s.static_framework = true
  
  s.resource_bundles = {
     'WYAKit' => ['WYAKit/Assets/*.xcassets']
  }
  
  s.subspec 'WYAHardware' do |ss|
      ss.source_files = 'WYAKit/Classes/WYAHardware/*.{h,m}'
      ss.subspec 'WYACamera' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAHardware/WYACamera/*.{h,m,md}'
          sss.subspec 'View' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAHardware/WYACamera/View/*'
          end
      end
      ss.subspec 'WYADownloader' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAHardware/WYADownloader/*.{h,m,md}'
          sss.subspec 'Model' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAHardware/WYADownloader/Model/*'
          end
          sss.subspec 'View' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAHardware/WYADownloader/View/*'
          end
      end
      ss.subspec 'WYAPhotoBrowser' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAHardware/WYAPhotoBrowser/*.{h,m,md}'
          sss.subspec 'Model' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAHardware/WYAPhotoBrowser/Model/*'
          end
          sss.subspec 'View' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAHardware/WYAPhotoBrowser/View/*'
          end
      end
      ss.subspec 'WYAVideoPlayer' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAHardware/WYAVideoPlayer/*'
      end
  end
  
 
  
  s.frameworks = 'UIKit', 'ImageIO'
  
  s.prefix_header_file = 'WYAKit/Classes/WYAHelp/WYAKitConfigePrefix.pch'
  
  s.dependency 'Masonry', '~> 1.1.0'
  s.dependency 'FMDB', '~>2.7.2'
  s.dependency 'JQFMDB', '~>1.1.6'
  s.dependency 'YYImage', '~> 1.0.4'
  s.dependency 'SVGKit'
  s.dependency 'MJRefresh'
  s.dependency 'SDWebImage'
  s.dependency 'Realm', '~> 3.11.1'
  s.dependency 'AFNetworking', '~> 3.0'
  #暂时未使用到的
  s.dependency 'YYText'
  
end
