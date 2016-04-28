message(STATUS "downloading...
     src='http://download.sourceforge.net/giflib/giflib-5.1.4.tar.gz'
     dst='/root/koreader/base/thirdparty/giflib/build/downloads/giflib-5.1.4.tar.gz'
     timeout='none'")




file(DOWNLOAD
  "http://download.sourceforge.net/giflib/giflib-5.1.4.tar.gz"
  "/root/koreader/base/thirdparty/giflib/build/downloads/giflib-5.1.4.tar.gz"
  SHOW_PROGRESS
  EXPECTED_HASH;MD5=8985c9411fdb2178b89d3348da9a06b0
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'http://download.sourceforge.net/giflib/giflib-5.1.4.tar.gz' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
