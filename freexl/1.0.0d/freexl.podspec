Pod::Spec.new do |s|
  s.name	= "freexl"
  s.version	= "1.0.0d"
  s.summary	= "FreeXL is an open source library to extract valid data from within an Excel (.xls) spreadsheet."
  s.homepage	= "https://www.gaia-gis.it/fossil/freexl/home"
  s.license	= "Mozilla Public License v1.1"
  s.author	= { " Alessandro Furieri" => "a.furieri@lqt.it" }
  s.source	= { :http => "http://www.gaia-gis.it/gaia-sins/freexl-1.0.0d.tar.gz" }

  s.ios.deployment_target = "4.0"
  s.osx.deployment_target = "10.6"

#  s.header_mappings_dir = "freexl-1.0.0d"

  s.source_files = "freexl-1.0.0d/src/*.c", "freexl-1.0.0.d/headers/*.h"

#  s.library 	= 'sqlite3'

  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/freexl/freexl-1.0.0d/headers' }

end
