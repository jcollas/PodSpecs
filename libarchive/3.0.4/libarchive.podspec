Pod::Spec.new do |s|
  s.name	= "libarchive"
  s.version	= "3.0.4"
  s.summary	= "Multi-format archive and compression library."
  s.homepage	= "http://libarchive.github.com"
  s.license	= "BSD 2"
  s.author	= "Tim Kientzle"
  s.source	= { :git => "https://github.com/libarchive/libarchive.git", :tag => "v3.0.4" }

  s.ios.deployment_target = "4.0"
  s.osx.deployment_target = "10.6"

  s.compiler_flags = '-DHAVE_CONFIG_H=1'

  s.source_files = "libarchive/*.{c,h}"

  def s.pre_install(pod, target_definition)
    config = <<-CONFIG_H
#define ARCHIVE_HASH_MD5_LIBSYSTEM 1
#define HAVE_ACL_CREATE_ENTRY 1
#define HAVE_ACL_GET_LINK_NP 1
#define HAVE_ACL_GET_PERM_NP 1
#define HAVE_ACL_INIT 1
#define HAVE_ACL_PERMSET_T 1
#define HAVE_ACL_SET_FD 1
#define HAVE_ACL_SET_FD_NP 1
#define HAVE_ACL_SET_FILE 1
#define HAVE_BZLIB_H 1
#define HAVE_CHFLAGS 1
#define HAVE_CHOWN 1
#define HAVE_CHROOT 1
#define HAVE_CTYPE_H 1
#define HAVE_DECL_EXTATTR_NAMESPACE_USER 0
#define HAVE_DECL_INT64_MAX 1
#define HAVE_DECL_INT64_MIN 1
#define HAVE_DECL_SIZE_MAX 1
#define HAVE_DECL_SSIZE_MAX 1
#define HAVE_DECL_STRERROR_R 1
#define HAVE_DECL_UINT32_MAX 1
#define HAVE_DECL_UINT64_MAX 1
#define HAVE_DIRENT_H 1
#define HAVE_DLFCN_H 1
#define HAVE_D_MD_ORDER 1
#define HAVE_EFTYPE 1
#define HAVE_EILSEQ 1
#define HAVE_ERRNO_H 1
#define HAVE_FCHDIR 1
#define HAVE_FCHFLAGS 1
#define HAVE_FCHMOD 1
#define HAVE_FCHOWN 1
#define HAVE_FCNTL 1
#define HAVE_FCNTL_H 1
#define HAVE_FORK 1
#define HAVE_FSEEKO 1
#define HAVE_FSETXATTR 1
#define HAVE_FSTAT 1
#define HAVE_FTRUNCATE 1
#define HAVE_FUTIMES 1
#define HAVE_GETEUID 1
#define HAVE_GETGRGID_R 1
#define HAVE_GETGRNAM_R 1
#define HAVE_GETPID 1
#define HAVE_GETPWNAM_R 1
#define HAVE_GETPWUID_R 1
#define HAVE_GETXATTR 1
#define HAVE_GRP_H 1
#define HAVE_INTMAX_T 1
#define HAVE_INTTYPES_H 1
#define HAVE_LANGINFO_H 1
#define HAVE_LCHFLAGS 1
#define HAVE_LCHMOD 1
#define HAVE_LCHOWN 1
#define HAVE_LIBBZ2 1
#define HAVE_LIBXML2 1
#define HAVE_LIBXML_XMLREADER_H 1
#define HAVE_LIBZ 1
#define HAVE_LIMITS_H 1
#define HAVE_LINK 1
#define HAVE_LISTXATTR 1
#define HAVE_LOCALE_H 1
#define HAVE_LONG_LONG_INT 1
#define HAVE_LSTAT 1
#define HAVE_LUTIMES 1
#define HAVE_MEMMOVE 1
#define HAVE_MEMORY_H 1
#define HAVE_MEMSET 1
#define HAVE_MKDIR 1
#define HAVE_MKFIFO 1
#define HAVE_MKNOD 1
#define HAVE_NL_LANGINFO 1
#define HAVE_PATHS_H 1
#define HAVE_PIPE 1
#define HAVE_POLL 1
#define HAVE_POLL_H 1
#define HAVE_PWD_H 1
#define HAVE_READLINK 1
#define HAVE_REGEX_H 1
#define HAVE_SELECT 1
#define HAVE_SETENV 1
#define HAVE_SETLOCALE 1
#define HAVE_SIGACTION 1
#define HAVE_SIGNAL_H 1
#define HAVE_STDARG_H 1
#define HAVE_STDINT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRCHR 1
#define HAVE_STRDUP 1
#define HAVE_STRERROR 1
#define HAVE_STRERROR_R 1
#define HAVE_STRFTIME 1
#define HAVE_STRINGS_H 1
#define HAVE_STRING_H 1
#define HAVE_STRRCHR 1
#define HAVE_STRUCT_STAT_ST_BIRTHTIME 1
#define HAVE_STRUCT_STAT_ST_BIRTHTIMESPEC_TV_NSEC 1
#define HAVE_STRUCT_STAT_ST_BLKSIZE 1
#define HAVE_STRUCT_STAT_ST_FLAGS 1
#define HAVE_STRUCT_STAT_ST_MTIMESPEC_TV_NSEC 1
#define HAVE_SYMLINK 1
#define HAVE_SYS_ACL_H 1
#define HAVE_SYS_CDEFS_H 1
#define HAVE_SYS_IOCTL_H 1
#define HAVE_SYS_PARAM_H 1
#define HAVE_SYS_POLL_H 1
#define HAVE_SYS_SELECT_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_SYS_TIME_H 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_SYS_WAIT_H 1
#define HAVE_SYS_XATTR_H 1
#define HAVE_TIMEGM 1
#define HAVE_TIME_H 1
#define HAVE_TZSET 1
#define HAVE_UINTMAX_T 1
#define HAVE_UNISTD_H 1
#define HAVE_UNSETENV 1
#define HAVE_UNSIGNED_LONG_LONG 1
#define HAVE_UNSIGNED_LONG_LONG_INT 1
#define HAVE_UTIME 1
#define HAVE_UTIMES 1
#define HAVE_UTIME_H 1
#define HAVE_VFORK 1
#define HAVE_VPRINTF 1
#define HAVE_WCHAR_H 1
#define HAVE_WCHAR_T 1
#define HAVE_WCRTOMB 1
#define HAVE_WCSCMP 1
#define HAVE_WCSCPY 1
#define HAVE_WCSLEN 1
#define HAVE_WCTOMB 1
#define HAVE_WCTYPE_H 1
#define HAVE_WMEMCMP 1
#define HAVE_WMEMCPY 1
#define HAVE_ZLIB_H 1
#define LIBARCHIVE_VERSION_NUMBER "2008005"
#define LIBARCHIVE_VERSION_STRING "3.0.4"
#define SIZEOF_WCHAR_T 4
#define STDC_HEADERS 1
#define TIME_WITH_SYS_TIME 1

/* Enable GNU extensions on systems that have them.  */
#ifndef _GNU_SOURCE
# define _GNU_SOURCE 1
#endif
/* Enable threading extensions on Solaris.  */
#ifndef _POSIX_PTHREAD_SEMANTICS
# define _POSIX_PTHREAD_SEMANTICS 1
#endif
#define VERSION "3.0.4"
#define _LZMA_UNIT32_IS_LONG 1
#define _LZMA_UINT32_IS_ULONG 1
#define HAVE_SYS_UTSNAME_H 1
CONFIG_H

    File.open("#{pod.root}/libarchive/config.h", "w") do |file|
      file.puts config
    end

  end

  s.library = 'xml2'
  s.xcconfig     = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }


end
