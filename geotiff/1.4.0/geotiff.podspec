Pod::Spec.new do |s|
  s.name	= "geotiff"
  s.version	= "1.4.0"
  s.summary	= "GeoTIFF is a TIFF based interchange format for georeferenced raster imagery."
  s.description = <<-DESC
GeoTIFF represents an effort by over 160 different remote sensing, GIS, cartographic, and surveying related companies and organizations to establish a  TIFF based interchange format for georeferenced raster imagery.
  DESC
  s.homepage	= "http://trac.osgeo.org/geotiff/"
  s.license	= { :type => "MIT",
		    :file => "COPYING" }
  s.author	= { "Frank Warmerdam" => "warmerdam@pobox.com" }
  s.source	= { :svn => "http://svn.osgeo.org/metacrs/geotiff", :tag => 'libgeotiff-1.4.0' }

  s.ios.deployment_target = "4.0"
  s.osx.deployment_target = "10.6"

  def s.pre_install(pod, target_definition)
    geo_config = <<-CONFIG_H
#define STDC_HEADERS 1
#define HAVE_STDLIB_H 1
#define HAVE_STRINGS_H 1
#define HAVE_STRING_H 1
#define HAVE_PROJECTS_H 1
/*
#define PACKAGE "proj"
#define PACKAGE_BUGREPORT "warmerdam@pobox.com"
#define PACKAGE_NAME "PROJ.4 Projections"
#define PACKAGE_STRING "PROJ.4 Projections 4.8.0"
#define PACKAGE_TARNAME "proj"
#define PACKAGE_VERSION "4.8.0"
#define VERSION "4.8.0"
*/
CONFIG_H

    File.open("#{pod.root}/geo_config.h", "w") do |file|
      file.puts geo_config
    end
  end

  s.source_files = "**.{c,h,inc}", "libxtiff/*.{c,h}"

  s.dependency 'tiff'

end
