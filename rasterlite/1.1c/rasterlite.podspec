Pod::Spec.new do |s|
  s.name	= "rasterlite"
  s.version	= "1.1c"
  s.summary	= "librasterlite is an open source library that stores and retrieves huge raster coverages using a SpatiaLite DBMS."
  s.homepage	= "https://www.gaia-gis.it/fossil/librasterlite/home"
  s.license	= "Mozilla Public License v1.1"
  s.author	= { " Alessandro Furieri" => "a.furieri@lqt.it" }
  s.source	= { :http => "http://www.gaia-gis.it/gaia-sins/librasterlite-sources/librasterlite-1.1c.tar.gz" }

  s.compiler_flags = '-DSPL_AMALGAMATION=1'

  s.ios.deployment_target = "4.0"
  s.osx.deployment_target = "10.6"

#  s.header_mappings_dir = "librasterlite-1.1c"

  s.source_files = "src/*.c", "headers/*.h"

  s.dependency 'spatialite'
  s.dependency 'geotiff'

#  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/spatialite/headers' }

end
