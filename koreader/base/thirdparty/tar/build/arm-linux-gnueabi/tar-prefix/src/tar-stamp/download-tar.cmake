message(STATUS "downloading...
     src='http://ftp.gnu.org/gnu/tar/tar-1.28.tar.gz'
     dst='/root/koreader/base/thirdparty/tar/build/downloads/tar-1.28.tar.gz'
     timeout='none'")




file(DOWNLOAD
  "http://ftp.gnu.org/gnu/tar/tar-1.28.tar.gz"
  "/root/koreader/base/thirdparty/tar/build/downloads/tar-1.28.tar.gz"
  SHOW_PROGRESS
  EXPECTED_HASH;MD5=6ea3dbea1f2b0409b234048e021a9fd7
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'http://ftp.gnu.org/gnu/tar/tar-1.28.tar.gz' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
