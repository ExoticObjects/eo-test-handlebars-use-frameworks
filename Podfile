platform :ios, '9.0'
use_frameworks!

pod 'handlebars-objc', '1.3.0'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|

      # Fix an issue with this pod.
      # See https://github.com/Bertrand/handlebars-objc/issues/15
      if target.name == 'handlebars-objc'
        config.build_settings['OTHER_CFLAGS'] = '-fno-objc-arc -w -Xanalyzer -analyzer-disable-all-checks'
        puts 'config.name: ' + config.name
        puts 'target.name: ' + target.name
        puts 'build_settings: ' + config.build_settings.inspect
        puts '**********'
      end
    end
  end
end