Pod::Spec.new do |s|
  s.name	= "spatialite"
  s.version	= "4.0"
  s.summary	= "SpatiaLite is an open source library intended to extend the SQLite core to support fully fledged Spatial SQL capabilities."
  s.homepage	= "https://www.gaia-gis.it/fossil/libspatialite/home"
  s.license	= { :type => "Mozilla Public License v1.1",
		    :file => "COPYING" }
  s.author	= { " Alessandro Furieri" => "a.furieri@lqt.it" }
  s.source	= { :http => "http://www.gaia-gis.it/gaia-sins/libspatialite-4.0.0.tar.gz" }

  s.compiler_flags = '-DVERSION=\"4.0.0\" -Isrc/gaiageo'
  s.ios.compiler_flags = '-U__APPLE__'

  s.ios.deployment_target = "4.0"
  s.osx.deployment_target = "10.6"

#  s.header_mappings_dir = "libspatialite-4.0.0"

#  s.source_files = FileList["src/**/*.{c,h}"].exclude(/^lex/, /geoJSON.c/, /Ewkt.c/, /Gml.c/, /Kml.c/)
  s.source_files = "libspatialite-4.0.0/src/{gaiaaux,gaiaexif,headers,shapefiles,spatialite,srsinit,versioninfo,virtualtext}/*.{c,h}", "src/gaiageo/gg_*.{c,h}", "src/gaiageo/*.h"

  s.preserve_paths = "src/headers/**/*.h", "src/gaiageo/*.{ch}"

  s.dependency 'sqlite3'
  s.dependency 'geos'
  s.dependency 'proj4'
  s.dependency 'freexl'

  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/spatialite/src/headers' }

end
