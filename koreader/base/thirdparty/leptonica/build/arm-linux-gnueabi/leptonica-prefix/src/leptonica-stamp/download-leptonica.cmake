message(STATUS "downloading...
     src='http://leptonica.com/source/leptonica-1.69.tar.gz'
     dst='/root/koreader/base/thirdparty/leptonica/build/downloads/leptonica-1.69.tar.gz'
     timeout='none'")




file(DOWNLOAD
  "http://leptonica.com/source/leptonica-1.69.tar.gz"
  "/root/koreader/base/thirdparty/leptonica/build/downloads/leptonica-1.69.tar.gz"
  SHOW_PROGRESS
  EXPECTED_HASH;MD5=d4085c302cbcab7f9af9d3d6f004ab22
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'http://leptonica.com/source/leptonica-1.69.tar.gz' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
