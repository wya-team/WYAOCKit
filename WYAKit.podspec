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
  
  
  
  s.subspec 'WYAHelp' do |ss|
      ss.source_files = 'WYAKit/Classes/WYAHelp/*.{h,m,pch}'
      ss.subspec 'WYAKitInstance' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAHelp/WYAKitInstance/*'
      end
  end
  
 
  
  s.subspec 'WYAUtils' do |ss|
      ss.subspec 'WYACategories' do |sss|
          sss.subspec 'Foundation' do |ssss|
              ssss.subspec 'NSArray' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/Foundation/NSArray/*'
              end
              ssss.subspec 'NSAttributedString' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/Foundation/NSAttributedString/*'
              end
              ssss.subspec 'NSDate' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/Foundation/NSDate/*'
              end
              ssss.subspec 'NSDictionary' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/Foundation/NSDictionary/*'
              end
              ssss.subspec 'NSNotificationCenter' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/Foundation/NSNotificationCenter/*'
              end
              ssss.subspec 'NSNumber' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/Foundation/NSNumber/*'
              end
              ssss.subspec 'NSObject' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/Foundation/NSObject/*'
              end
              ssss.subspec 'NSString' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/Foundation/NSString/*'
              end
          end
          sss.subspec 'WYAUI' do |ssss|
              ssss.subspec 'UIButton' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/WYAUI/UIButton/*'
              end
              ssss.subspec 'UIColor' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/WYAUI/UIColor/*'
              end
              ssss.subspec 'UIImage' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/WYAUI/UIImage/*'
              end
              ssss.subspec 'UILabel' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/WYAUI/UILabel/*'
              end
              ssss.subspec 'UIMenuItem' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/WYAUI/UIMenuItem/*'
              end
              ssss.subspec 'UINavigationViewController' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/WYAUI/UINavigationViewController/*'
              end
              ssss.subspec 'UITableView' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/WYAUI/UITableView/*'
              end
              ssss.subspec 'UITextFiled' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/WYAUI/UITextFiled/*'
              end
              ssss.subspec 'UIView' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/WYAUI/UIView/*'
              end
              ssss.subspec 'UIViewController' do |sssss|
                  sssss.source_files = 'WYAKit/Classes/WYAUtils/WYACategories/WYAUI/UIViewController/*'
              end
          end
      end
      ss.subspec 'WYAClearCache' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUtils/WYAClearCache/*'
      end
      ss.subspec 'WYARealm' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUtils/WYARealm/*'
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
