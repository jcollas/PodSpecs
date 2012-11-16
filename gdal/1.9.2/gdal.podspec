Pod::Spec.new do |s|
  s.name	= "gdal"
  s.version	= "1.9.2"
  s.summary	= "GDAL is a translator library for raster geospatial data formats."
  s.homepage	= "http://gdal.org"
  s.license	= "MIT"
  s.author	= { "Frank Warmerdam" => "me@yury.ca" }
  s.source	= { :svn => "http://svn.osgeo.org/gdal", :tag => '1.9.2' }

  $ver_info =  { "@VERSION@" => "3.3.5",
		"@VERSION_MAJOR@" => "3",
		"@VERSION_MINOR@" => "3",
		"@VERSION_PATCH@" => "5",
		"@JTS_PORT@" => "1.12.0",
		"@CAPI_VERSION@" => "1.7.5",
		"@CAPI_VERSION_MAJOR@" => "1",
		"@CAPI_VERSION_MINOR@" => "7",
		"@CAPI_VERSION_PATCH@" => "5" }

  s.ios.deployment_target = "4.0"
  s.osx.deployment_target = "10.6"

  # gross hack to make this work with AFNetworking
  s.compiler_flags = '-D_SYSTEMCONFIGURATION_H -D__MOBILECORESERVICES__ -D__CORESERVICES__ -DCPU_LITTLE_ENDIAN'
#  s.header_mappings_dir = 'include'

  # process .h.in define files.
  def s.process_h_in(h_filename, contents, pattern, substs)
    File.open(h_filename, "w") do |h_file|
      if (contents.nil?)
        File.open("#{h_filename}.in", "r") do |in_file|
          contents = in_file.read
        end
      end
      if (!pattern.nil?)
        contents = contents.gsub(pattern, substs)
      end
      h_file.puts contents
    end
  end

  def s.pre_install(pod, target_definition)
    platform_config = <<-CONFIG_H
#ifndef GEOS_PLATFORM_H
#define GEOS_PLATFORM_H

#define HAVE_LONG_INT_64 1
#define HAVE_FINITE 1
#define HAVE_ISFINITE 1
#ifdef HAVE_IEEEFP_H
extern "C"
{
#include <ieeefp.h>
}
#endif
#ifdef HAVE_INT64_T_64
extern "C"
{
#include <inttypes.h>
}
#endif
#include <limits> // for std::numeric_limits
#define DoubleNotANumber std::numeric_limits<double>::quiet_NaN()
#define DoubleInfinity std::numeric_limits<double>::infinity()
#define DoubleNegInfinity -std::numeric_limits<double>::infinity()
#define DoubleMax std::numeric_limits<double>::max()

#ifdef HAVE_INT64_T_64
  typedef int64_t int64;
#else
# ifdef HAVE_LONG_LONG_INT_64
   typedef long long int int64;
# else
   typedef long int int64;
# endif
#endif
#  define FINITE(x) (isfinite(x))

#if defined(HAVE_ISNAN)
# define ISNAN(x) (isnan(x))
#else
#  define ISNAN(x) (std::isnan(x))
#endif

#ifndef ISNAN
#error "Can not compile without isnan function or macro"
#endif

#endif
CONFIG_H

#    process_h_in("#{pod.root}/include/geos/platform.h", platform_config, nil, nil);
#    process_h_in("#{pod.root}/include/geos/version.h", nil, /@.*?@/, $ver_info);
#    process_h_in("#{pod.root}/capi/geos_c.h", nil, /@.*?@/, $ver_info);

  end

  s.source_files = FileList['**/*.cpp'].exclude(/apps/, /dods/, /ecw/, /epsilon/, /georaster/, /fits/, /grass/, /gta/, /hdf/, /jp2kak/, /jpeg2000/, /jpegls/, /jpipkak/, /mysql/), '**/*.h', '**/*.c'
  s.preserve_paths = '**/*.inc'

  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/gdal ${PODS_ROOT}/gdal/frmts/pcidsk/sdk ${PODS_ROOT}/frmts/gtiff/libgeotiff' }

end
