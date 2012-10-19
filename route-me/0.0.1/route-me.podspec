Pod::Spec.new do |s|
  s.name         = "route-me"
  s.version      = "0.0.1"
  s.summary      = "Route-Me is an open source map library that runs natively on iOS."
  s.homepage     = "https://github.com/route-me/route-me"
  s.license      = { :type => "Free",
		     :file => 'LicenseRouteMe.txt' }
  s.author       = { "Route-Me Contributors" => "route-me@github.com" }
  s.source       = { :git => "https://github.com/route-me/route-me.git", :commit => "f689eb2274" }

  s.platform	 = :ios
  
  s.source_files = FileList['MapView/Map/*.{m,c,h}'].exclude(/RMTiledLayerController.m/)
  s.resources = 'MapView/Map/Resources/*.png', 'MapView/Map/*.png'

  s.dependency 'FMDB'
  s.dependency 'proj4'

end
