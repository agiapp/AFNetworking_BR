Pod::Spec.new do |s|
  s.name     = 'AFNetworking_BR'
  s.summary  = 'A delightful networking framework for Apple platforms.'
  s.version  = '4.0.3'
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.authors  = { "renbo" => "developer@irenb.com" }
  s.social_media_url = 'https://www.irenb.com'
  s.homepage = 'https://github.com/agiapp/AFNetworking_BR'
  
  s.source = { :git => 'https://github.com/agiapp/AFNetworking_BR.git', :tag => s.version.to_s }
  s.resource_bundles = { 'AFNetworking.Privacy' => 'AFNetworking/PrivacyInfo.xcprivacy' }
    
  # 最低部署版本
  s.ios.deployment_target = '12.0'
  s.osx.deployment_target = '10.13'

  s.source_files = 'AFNetworking/AFNetworking.h'

  s.subspec 'Serialization' do |ss|
    ss.source_files = 'AFNetworking/AFURL{Request,Response}Serialization.{h,m}'
  end

  s.subspec 'Security' do |ss|
    ss.source_files = 'AFNetworking/AFSecurityPolicy.{h,m}'
  end

  s.subspec 'Reachability' do |ss|
    ss.ios.deployment_target = '12.0'
    ss.osx.deployment_target = '10.13'

    ss.source_files = 'AFNetworking/AFNetworkReachabilityManager.{h,m}'
  end

  s.subspec 'NSURLSession' do |ss|
    ss.dependency 'AFNetworking_BR/Serialization'
    ss.ios.dependency 'AFNetworking_BR/Reachability'
    ss.osx.dependency 'AFNetworking_BR/Reachability'
    ss.dependency 'AFNetworking_BR/Security'

    ss.source_files = 'AFNetworking/AF{URL,HTTP}SessionManager.{h,m}', 'AFNetworking/AFCompatibilityMacros.h'
  end

  s.subspec 'UIKit' do |ss|
    ss.ios.deployment_target = '12.0'
    ss.dependency 'AFNetworking_BR/NSURLSession'

    ss.source_files = 'UIKit+AFNetworking'
  end
end
