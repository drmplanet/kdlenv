PROJECT(giflib)
cmake_minimum_required(VERSION 2.8.3)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/../cmake_modules")
include("koreader_thirdparty_common")

enable_language(C)

ep_get_source_dir(SOURCE_DIR)
ep_get_binary_dir(BINARY_DIR)

set(CFG_ENV_VAR "CC=\"${CC}\" CFLAGS=\"${CFLAGS}\" LDFLAGS=\"${LDFLAGS}\" ")
set(CFG_OPTS "-q --prefix=${BINARY_DIR} --disable-static --enable-shared --host=\"${CHOST}\"")
set(CFG_CMD sh -c "${CFG_ENV_VAR} ${SOURCE_DIR}/configure ${CFG_OPTS}")
# use limits.h instead of stdint.h for android build
if(${IS_ANDROID})
    set(CFG_CMD "${CFG_CMD} && ${ISED} \"s|stdint.h|limits.h|g\" ${SOURCE_DIR}/lib/openbsd-reallocarray.c")
endif()

set(GIFLIB_VER "5.1.4")
include(ExternalProject)
ExternalProject_Add(
    ${PROJECT_NAME}
    URL http://download.sourceforge.net/giflib/giflib-${GIFLIB_VER}.tar.gz
    URL_MD5 8985c9411fdb2178b89d3348da9a06b0
    DOWNLOAD_DIR ${KO_DOWNLOAD_DIR}
    CONFIGURE_COMMAND ${CFG_CMD}
    BUILD_COMMAND $(MAKE) -j${PARALLEL_JOBS} --silent
    INSTALL_COMMAND $(MAKE) -j${PARALLEL_JOBS} --silent install
)
