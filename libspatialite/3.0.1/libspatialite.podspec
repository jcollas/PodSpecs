Pod::Spec.new do |s|
  s.name	= "libspatialite"
  s.version	= "3.0.1"
  s.summary	= "SpatiaLite is an open source library intended to extend the SQLite core to support fully fledged Spatial SQL capabilities."
  s.homepage	= "https://www.gaia-gis.it/fossil/libspatialite/home"
  s.license	= "Mozilla Public License v1.1"
  s.author	= { " Alessandro Furieri" => "a.furieri@lqt.it" }
  s.source	= { :http => "http://www.gaia-gis.it/gaia-sins/libspatialite-3.0.1.tar.gz" }

  s.ios.deployment_target = "4.0"
  s.osx.deployment_target = "10.6"

  s.header_mappings_dir = "libspatialite-3.0.1"

  s.source_files = "libspatialite-3.0.1/src/**"

  s.library 	= 'sqlite3'

end
