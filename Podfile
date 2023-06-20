# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'MovieTestingApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for MovieTestingApp
  
  target 'MovieTestingAppTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  target 'MovieTestingAppUITests' do
    # Pods for testing
  end
  
  pod 'Alamofire'
  pod 'Kingfisher'
  pod 'YouTubePlayer'
  pod 'SwiftyJSON'
  pod 'SwiftMessages'
  pod 'Toast-Swift'
  
  #for xCode 14.x
  post_install do |installer|
    installer.generated_projects.each do |project|
      project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
      end
    end
  end
  
end
