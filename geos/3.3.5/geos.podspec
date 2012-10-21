Pod::Spec.new do |s|
  s.name	= "geos"
  s.version	= "3.3.5"
  s.summary	= "GEOS (Geometry Engine - Open Source) is a C++ port of the Java Topology Suite (JTS)."
  s.homepage	= "http://trac.osgeo.org/geos/"
  s.license	= "GNU LGPL 2.1"
  s.author	= { "Yury Bychkov" => "me@yury.ca",
		    "Martin Davis" => "mbdavis@refractions.net" }
  s.source	= { :svn => "http://svn.osgeo.org/geos", :tag => '3.3.5' }

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
#if defined(__GNUC__) && defined(_WIN32)
#include <float.h>
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
#  ifndef HAVE_LONG_INT_64
#   define INT64_IS_REALLY32 1
#   warning "Could not find 64bit integer definition!"
#  endif
# endif
#endif
#if defined(HAVE_FINITE) && !defined(HAVE_ISFINITE)
# define FINITE(x) (finite(x))
#else
# if defined(_MSC_VER)
#  define FINITE(x) _finite(static_cast<double>(x))    
# else
#  define FINITE(x) (isfinite(x))
# endif
#endif

#if defined(HAVE_ISNAN)
# define ISNAN(x) (isnan(x))
#else
# if defined(_MSC_VER)
#  define ISNAN(x) _isnan(x)
# elif defined(__MINGW32__)
#  define ISNAN(x) (std::isnan(x))
# elif defined(__OSX__) || defined(__APPLE__)
#  define ISNAN(x) (std::isnan(x))
# elif defined(__sun) || defined(__sun__)
#  include <math.h>
#  define ISNAN(x) (::isnan(x))
# endif
#endif

#ifndef FINITE
#error "Can not compile without finite or isfinite function or macro"
#endif

#ifndef ISNAN
#error "Can not compile without isnan function or macro"
#endif

#endif
CONFIG_H

    process_h_in("#{pod.root}/include/geos/platform.h", platform_config, nil, nil);
    process_h_in("#{pod.root}/include/geos/version.h", nil, /@.*?@/, $ver_info);
    process_h_in("#{pod.root}/capi/geos_c.h", nil, /@.*?@/, $ver_info);

#    File.delete("#{pod.root}/capi/geos_c.h.in");
  end

  s.source_files = FileList['src/**/*.{cpp,h}'].exclude(/tests/), 'include/**', 'capi/*.{cpp,h,in}'

  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/geos/include ${PODS_ROOT}/geos/capi' }

end
