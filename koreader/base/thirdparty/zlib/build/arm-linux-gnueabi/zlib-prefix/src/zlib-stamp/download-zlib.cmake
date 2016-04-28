message(STATUS "downloading...
     src='http://zlib.net/zlib-1.2.8.tar.gz'
     dst='/root/koreader/base/thirdparty/zlib/build/downloads/zlib-1.2.8.tar.gz'
     timeout='none'")




file(DOWNLOAD
  "http://zlib.net/zlib-1.2.8.tar.gz"
  "/root/koreader/base/thirdparty/zlib/build/downloads/zlib-1.2.8.tar.gz"
  SHOW_PROGRESS
  EXPECTED_HASH;MD5=44d667c142d7cda120332623eab69f40
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'http://zlib.net/zlib-1.2.8.tar.gz' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
