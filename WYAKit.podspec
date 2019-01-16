#
# Be sure to run `pod lib lint WYAKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WYAKit'
  s.version          = '0.1.1'
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
  
  s.subspec 'WYACategories' do |ss|
      ss.subspec 'Foundation' do |sss|
          sss.source_files = 'WYAKit/Classes/WYACategories/Foundation/*'
      end
  end
  
  s.subspec 'WYAClearCache' do |ss|
      
  end
  
  s.subspec 'WYACompareVersion' do |ss|
      
  end
  
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
  
  s.subspec 'WYAHelp' do |ss|
      ss.source_files = 'WYAKit/Classes/WYAHelp/*.{h,m,pch}'
      ss.subspec 'WYAKitInstance' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAHelp/WYAKitInstance/*'
      end
  end
  
  s.subspec 'WYAUIKit' do |ss|
      ss.subspec 'WYAAlertController' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYAAlertController/*.{h,m,md}'
          sss.subspec 'View' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAUIKit/WYAAlertController/View/*'
          end
          sss.subspec 'ViewModel' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAUIKit/WYAAlertController/ViewModel/*'
          end
      end
      ss.subspec 'WYABannerView' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYABannerView/*.{h,m,md}'
      end
      ss.subspec 'WYACard' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYACard/*.{h,m,md}'
      end
      ss.subspec 'WYACell' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYACell/*.md'
          sss.subspec 'WYACollectionCell' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAUIKit/WYACell/WYACollectionCell/*'
          end
          sss.subspec 'WYATabelCell' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAUIKit/WYACell/WYATabelCell/*'
          end
      end
      ss.subspec 'WYADrawerViewController' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYADrawerViewController/*'
      end
      ss.subspec 'WYAImageBrowser' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYAImageBrowser/*.{h,m,md}'
          sss.subspec 'View' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAUIKit/WYAImageBrowser/View/*'
          end
      end
      ss.subspec 'WYAImageCrop' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYAImageCrop/*.{h,m,md}'
          sss.subspec 'Model' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAUIKit/WYAImageCrop/Model/*'
          end
          sss.subspec 'View' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAUIKit/WYAImageCrop/View/*'
          end
      end
      ss.subspec 'WYAIMGCode' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYAIMGCode/*'
      end
      ss.subspec 'WYANavBar' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYANavBar/*'
      end
      ss.subspec 'WYANoticeBar' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYANoticeBar/*'
      end
      ss.subspec 'WYANumberKeyboard' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYANumberKeyboard/*'
      end
      ss.subspec 'WYAOptionMenu' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYAOptionMenu/*.{h,m,md}'
          sss.subspec 'Model' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAUIKit/WYAOptionMenu/Model/*'
          end
          sss.subspec 'View' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAUIKit/WYAOptionMenu/View/*'
          end
      end
      ss.subspec 'WYAPageViewController' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYAPageViewController/*.{h,m,md}'
          sss.subspec 'WYAMenuViews' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAUIKit/WYAPageViewController/WYAMenuViews/*'
          end
      end
      ss.subspec 'WYAPaginationView' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYAPaginationView/*'
      end
      ss.subspec 'WYAPickerView' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYAPickerView/*.{h,m,md}'
          sss.subspec 'WYAPickerView' do |ssss|
              ssss.source_files = 'WYAKit/Classes/WYAUIKit/WYAPickerView/WYAPickerView/*'
          end
      end
      ss.subspec 'WYAPopoverBackgroundView' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYAPopoverBackgroundView/*'
      end
      ss.subspec 'WYAProgressView' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYAProgressView/*'
      end
      ss.subspec 'WYASearchBar' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYASearchBar/*'
      end
      ss.subspec 'WYASegmentedControl' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYASegmentedControl/*'
      end
      ss.subspec 'WYAShareView' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYAShareView/*'
      end
      ss.subspec 'WYASlidder' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYASlidder/*'
      end
      ss.subspec 'WYAStepperView' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYAStepperView/*'
      end
      ss.subspec 'WYATextView' do |sss|
          sss.source_files = 'WYAKit/Classes/WYAUIKit/WYATextView/*'
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
