Pod::Spec.new do |s|
  s.name         = "TileTools"
  s.version      = "0.0.1"
  s.summary      = "TileTools is a library to help manage map tile sources."
  s.homepage     = "https://github.com/rvsrvs/TileTools"
  s.license      = { :type => "Apache 2.0" }
  s.author       = { "Van Simmons" => "rvsrvs@mac.com" }
  s.source       = { :git => "https://github.com/rvsrvs/TileTools.git" }

  s.ios.deployment_target = "5.0"
  s.osx.deployment_target = "10.7"
  
  s.source_files = FileList['TileTools/**/*.{m,h}'].exclude(/Test/)

  s.requires_arc = true

  s.dependency 'AFNetworking'
  s.dependency 'libarchive'

end
