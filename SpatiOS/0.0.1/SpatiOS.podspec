Pod::Spec.new do |s|
  s.name         = "SpatiOS"
  s.version      = "0.0.1"
  s.summary      = "SpatiOS is a collection of gis-related libraries packaged for iOS"
  s.homepage     = "https://github.com/rvsrvs/SpatiOS"
  s.license      = 'MIT'
  s.author       = { "Van Simmons" => "rvsrvs@mac.com",
		     "Juan J. Collas" => "jcollas@moreira.com" }
  s.source	= { :git => "https://github.com/jcollas/SpatiOS.git", :commit => '2daf415602' }

  s.platform	 = :ios

  s.source_files = 'SpatiOS/*.{h,m}'

  s.dependency 'SoloComponents-iOS'
  s.dependency 'UIDeviceAddition'
  s.dependency 'geos'
  s.dependency 'proj4'
  s.dependency 'shapelib'
  s.dependency 'libspatialite'
  s.dependency 'SBJson'
end
