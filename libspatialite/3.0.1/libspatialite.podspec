Pod::Spec.new do |s|
  s.name	= "libspatialite"
  s.version	= "3.0.1"
  s.summary	= "SpatiaLite is an open source library intended to extend the SQLite core to support fully fledged Spatial SQL capabilities."
  s.homepage	= "https://www.gaia-gis.it/fossil/libspatialite/home"
  s.license	= "Mozilla Public License v1.1"
  s.author	= { " Alessandro Furieri" => "a.furieri@lqt.it" }
#  s.source	= { :http => "http://www.gaia-gis.it/gaia-sins/libspatialite-3.0.1.tar.gz" }
  s.source	= { :http => "http://www.gaia-gis.it/gaia-sins/libspatialite-amalgamation-3.0.1.tar.gz" }

  s.compiler_flags = '-DVERSION=\"3.0.1\" -DOMIT_GEOCALLBACKS -DSPL_AMALGAMATION=1'
  s.ios.compiler_flags = '-U__APPLE__'

  s.ios.deployment_target = "4.0"
  s.osx.deployment_target = "10.6"

#  s.header_mappings_dir = "libspatialite-3.0.1"
  s.header_mappings_dir = "libspatialite-amalgamation-3.0.1"

#  s.source_files = "libspatialite-3.0.1/src/**/*.{c,h}"
  s.source_files = "libspatialite-amalgamation-3.0.1/*.c"
  s.preserve_paths = "libspatialite-amalgamation-3.0.1/headers/**/*.h"

#  s.library 	= 'sqlite3'
  s.dependency 'geos'
  s.dependency 'proj4'
  s.dependency 'freexl'

#  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/libspatialite/libspatialite-3.0.1/src/headers' }
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/libspatialite/libspatialite-amalgamation-3.0.1/headers' }

end
