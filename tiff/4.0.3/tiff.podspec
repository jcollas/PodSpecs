Pod::Spec.new do |s|
  s.name	= "tiff"
  s.version	= "4.0.3"
  s.summary	= "Tag Image File Format (TIFF) library."
  s.homepage	= "http://www.remotesensing.org/libtiff/"
  s.license	= { :type => "MIT",
		    :file => "tiff-4.0.3/COPYRIGHT" }
  s.author	= "Sam Leffler"
  s.source	= { :http => "http://download.osgeo.org/libtiff/tiff-4.0.3.tar.gz" }

  s.ios.deployment_target = "4.0"
  s.osx.deployment_target = "10.6"

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
    tif_config = <<-CONFIG_H
#define CCITT_SUPPORT 1
#define CHECK_JPEG_YCBCR_SUBSAMPLING 1
#define CXX_SUPPORT 1
#define DEFAULT_EXTRASAMPLE_AS_ALPHA 1
#define HAVE_ASSERT_H 1
#define HAVE_DLFCN_H 1
#define HAVE_FCNTL_H 1
#define HAVE_FLOOR 1
#define HAVE_GETOPT 1
#define HAVE_GLUT_GLUT_H 1
#define HAVE_IEEEFP 1
#define HAVE_INTTYPES_H 1
#define HAVE_ISASCII 1
#define HAVE_LFIND 1
#define HAVE_LIMITS_H 1
#define HAVE_MEMMOVE 1
#define HAVE_MEMORY_H 1
#define HAVE_MEMSET 1
#define HAVE_MMAP 1
#define HAVE_OPENGL_GLU_H 1
#define HAVE_OPENGL_GL_H 1
#define HAVE_POW 1
#define HAVE_PTHREAD 1
#define HAVE_SEARCH_H 1
#define HAVE_SETMODE 1
#define HAVE_SQRT 1
#define HAVE_STDINT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRCASECMP 1
#define HAVE_STRCHR 1
#define HAVE_STRINGS_H 1
#define HAVE_STRING_H 1
#define HAVE_STRRCHR 1
#define HAVE_STRSTR 1
#define HAVE_STRTOL 1
#define HAVE_STRTOUL 1
#define HAVE_STRTOULL 1
#define HAVE_SYS_STAT_H 1
#define HAVE_SYS_TIME_H 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_UNISTD_H 1
#define HOST_BIGENDIAN 0
#define HOST_FILLORDER FILLORDER_LSB2MSB
#define LOGLUV_SUPPORT 1
#define LT_OBJDIR ".libs/"
#define LZW_SUPPORT 1
#define MDI_SUPPORT 1
#define NEXT_SUPPORT 1
#define PACKAGE "tiff"
#define PACKAGE_BUGREPORT "tiff@lists.maptools.org"
#define PACKAGE_NAME "LibTIFF Software"
#define PACKAGE_STRING "LibTIFF Software 4.0.3"
#define PACKAGE_TARNAME "tiff"
#define PACKAGE_URL ""
#define PACKAGE_VERSION "4.0.3"
#define PACKBITS_SUPPORT 1
#define PIXARLOG_SUPPORT 1
#define SIZEOF_SIGNED_INT 4
#define SIZEOF_SIGNED_LONG 8
#define SIZEOF_SIGNED_LONG_LONG 8
#define SIZEOF_SIGNED_SHORT 2
#define SIZEOF_UNSIGNED_CHAR_P 8
#define SIZEOF_UNSIGNED_INT 4
#define SIZEOF_UNSIGNED_LONG 8
#define SIZEOF_UNSIGNED_LONG_LONG 8
#define SIZEOF_UNSIGNED_SHORT 2
#define STDC_HEADERS 1
#define STRIPCHOP_DEFAULT TIFF_STRIPCHOP
#define STRIP_SIZE_DEFAULT 8192
#define SUBIFD_SUPPORT 1
#define THUNDER_SUPPORT 1
#define TIFF_INT16_T signed short
#define TIFF_INT32_FORMAT "%d"
#define TIFF_INT32_T signed int
#define TIFF_INT64_FORMAT "%ld"
#define TIFF_INT64_T signed long
#define TIFF_INT8_T signed char
#define TIFF_PTRDIFF_FORMAT "%ld"
#define TIFF_PTRDIFF_T ptrdiff_t
#define TIFF_SSIZE_FORMAT "%ld"
#define TIFF_SSIZE_T signed long
#define TIFF_UINT16_T unsigned short
#define TIFF_UINT32_FORMAT "%u"
#define TIFF_UINT32_T unsigned int
#define TIFF_UINT64_FORMAT "%lu"
#define TIFF_UINT64_T unsigned long
#define TIFF_UINT8_T unsigned char
#define TIME_WITH_SYS_TIME 1
#define VERSION "4.0.3"
#if defined AC_APPLE_UNIVERSAL_BUILD
# if defined __BIG_ENDIAN__
#  define WORDS_BIGENDIAN 1
# endif
#else
# ifndef WORDS_BIGENDIAN
/* #  undef WORDS_BIGENDIAN */
# endif
#endif
#define X_DISPLAY_MISSING 1
#define ZIP_SUPPORT 1
#ifndef _DARWIN_USE_64_BIT_INODE
# define _DARWIN_USE_64_BIT_INODE 1
#endif
CONFIG_H

    process_h_in("#{pod.root}/tiff-4.0.3/libtiff/tif_config.h", tif_config, nil, nil);

  tiffconf = <<-TIFFCONF_H
#ifndef _TIFFCONF_
#define _TIFFCONF_

#define TIFF_INT16_T signed short
#define TIFF_INT32_T signed int
#define TIFF_INT64_T signed long
#define TIFF_INT8_T signed char
#define TIFF_UINT16_T unsigned short
#define TIFF_UINT32_T unsigned int
#define TIFF_UINT64_T unsigned long
#define TIFF_UINT8_T unsigned char
#define TIFF_SSIZE_T signed long
#define TIFF_PTRDIFF_T ptrdiff_t
#define HAVE_IEEEFP 1
#define HOST_FILLORDER FILLORDER_LSB2MSB
#define HOST_BIGENDIAN 0
#define CCITT_SUPPORT 1
#define LOGLUV_SUPPORT 1
#define LZW_SUPPORT 1
#define NEXT_SUPPORT 1
#define PACKBITS_SUPPORT 1
#define PIXARLOG_SUPPORT 1
#define THUNDER_SUPPORT 1
#define ZIP_SUPPORT 1
#define STRIPCHOP_DEFAULT TIFF_STRIPCHOP
#define SUBIFD_SUPPORT 1
#define DEFAULT_EXTRASAMPLE_AS_ALPHA 1
#define CHECK_JPEG_YCBCR_SUBSAMPLING 1
#define MDI_SUPPORT 1

#define COLORIMETRY_SUPPORT
#define YCBCR_SUPPORT
#define CMYK_SUPPORT
#define ICC_SUPPORT
#define PHOTOSHOP_SUPPORT
#define IPTC_SUPPORT

#endif /* _TIFFCONF_ */
TIFFCONF_H

    process_h_in("#{pod.root}/tiff-4.0.3/libtiff/tiffconf.h", tiffconf, nil, nil);
  end

  s.source_files = FileList["tiff-4.0.3/libtiff/**.{cxx,c,h}"].exclude(/win32/)

  s.library = 'z'

end
