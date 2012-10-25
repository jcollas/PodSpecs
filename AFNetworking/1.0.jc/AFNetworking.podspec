Pod::Spec.new do |s|
  s.name     = 'AFNetworking'
  s.version  = '1.0.jc'
  s.license  = 'MIT'
  s.summary  = 'A delightful iOS and OS X networking framework.'
  s.homepage = 'https://github.com/AFNetworking/AFNetworking'
  s.authors  = {'Mattt Thompson' => 'm@mattt.me', 'Scott Raymond' => 'sco@gowalla.com'}
  s.source   = { :git => 'https://github.com/AFNetworking/AFNetworking.git', :tag => '1.0' }
  s.source_files = 'AFNetworking'
  s.requires_arc = true

  s.ios.deployment_target = '5.0'
  s.ios.frameworks = 'MobileCoreServices', 'SystemConfiguration'

  s.osx.deployment_target = '10.7'
  s.osx.frameworks = 'CoreServices', 'SystemConfiguration'

  def s.post_install(target)

    header_prefix = <<-EOS

#if __IPHONE_OS_VERSION_MIN_REQUIRED
  #import <SystemConfiguration/SystemConfiguration.h>
  #import <MobileCoreServices/MobileCoreServices.h>
#else
  #import <SystemConfiguration/SystemConfiguration.h>
  #import <CoreServices/CoreServices.h>
#endif
EOS

    old_header = File.read( config.project_pods_root + 'AFNetworking/AFNetworking/AFHTTPClient.h' )
    File.open(config.project_pods_root + 'AFNetworking/AFNetworking/AFHTTPClient.h', "w+") do |file|
      file.puts old_header.sub(/h>/, "h>#{header_prefix}")
    end
  end

end
