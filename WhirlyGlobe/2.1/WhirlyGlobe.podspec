Pod::Spec.new do |s|
  s.name         = "WhirlyGlobe"
  s.version      = "2.1"
  s.summary      = "WhirlyGlobe is a self contained 3D earth display view suitable for use in iPhone and iPad applications."
  s.homepage     = "https://github.com/mousebird/WhirlyGlobe"
  s.license      = { :type => "Apache 2.0" }
  s.author       = { "Steve Gifford" => "sjg@mousebirdconsulting.com" }
  s.source       = { :git => "https://github.com/jcollas/WhirlyGlobe.git", :branch => "develop" }

  s.platform	 = :ios
  
  s.source_files = 'WhirlyGlobeSrc/{WhirlyGlobeLib,WhirlyGlobe-MaplyComponent}/{src,include}/**/*.{mm,m,h}'
  s.public_header_files = FileList['WhirlyGlobeSrc/{WhirlyGlobeLib,WhirlyGlobe-MaplyComponent}/include/**/*.{h}'].exclude(/private/)

  s.requires_arc = true

  s.dependency 'eigen'
  s.dependency 'boost/shared_ptr-includes'
  s.dependency 'boost/pointer_cast-includes'
  s.dependency 'proj4'
  s.dependency 'shapelib'
  s.dependency 'clipper'
  s.dependency 'boost/math-includes'

  s.library    =  'stdc++', 'sqlite3'
  s.frameworks = 'UIKit', 'QuartzCore', 'OpenGLES'

end
