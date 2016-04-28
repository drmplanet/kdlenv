if("7f21045094191804149b36a7cea3045bba0770d9" STREQUAL "")
  message(FATAL_ERROR "Tag for git checkout should not be empty.")
endif()

set(run 0)

######################################################################
# 1. if not cloned before, do a git clone
# 2. are we already at the given commit hash?
#   2.1. checkout to the given commit hash
#   2.2. if checkout failed, git fetch && checkout again
# 4. git submodules update
# 5. copy everything over to source directory
######################################################################

if("/root/koreader/base/thirdparty/sdcv/build/arm-linux-gnueabi/git_checkout/stamp/sdcv-gitinfo-7f21045094191804149b36a7cea3045bba0770d9.txt" IS_NEWER_THAN "/root/koreader/base/thirdparty/sdcv/build/arm-linux-gnueabi/git_checkout/stamp/sdcv-gitclone-lastrun.txt")
  set(run 1)
endif()

if(NOT run)
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/root/koreader/base/thirdparty/sdcv/build/arm-linux-gnueabi/git_checkout/stamp/sdcv-gitclone-lastrun.txt'")
  return()
endif()

set(should_clone 1)
if(EXISTS "/root/koreader/base/thirdparty/sdcv/build/git_checkout")
  if(EXISTS "/root/koreader/base/thirdparty/sdcv/build/git_checkout/sdcv")
    execute_process(
      COMMAND "/usr/bin/git" rev-parse HEAD
      WORKING_DIRECTORY "/root/koreader/base/thirdparty/sdcv/build/git_checkout/sdcv"
      RESULT_VARIABLE error_code
      OUTPUT_VARIABLE output
    )
    if(error_code)
      message("Failed to read current tag, recloning the repo...")
      file(REMOVE_RECURSE "/root/koreader/base/thirdparty/sdcv/build/git_checkout/sdcv")
    else()
      string(STRIP "${output}" curr_tag)
      set(should_clone 0)
    endif()
  endif()
else()
  make_directory("/root/koreader/base/thirdparty/sdcv/build/git_checkout")
endif()

if(should_clone)
  # try the clone 3 times incase there is an odd git clone issue
  set(error_code 1)
  set(number_of_tries 0)
  while(error_code AND number_of_tries LESS 3)
    execute_process(
      COMMAND "/usr/bin/git" clone "git://github.com/koreader/sdcv.git" "sdcv"
      WORKING_DIRECTORY "/root/koreader/base/thirdparty/sdcv/build/git_checkout"
      RESULT_VARIABLE error_code
    )
    math(EXPR number_of_tries "${number_of_tries} + 1")
  endwhile()
  if(number_of_tries GREATER 1)
    message(STATUS "Had to git clone more than once:
            ${number_of_tries} times.")
  endif()
  if(error_code)
    message(FATAL_ERROR "Failed to clone repository: 'git://github.com/koreader/sdcv.git'")
  endif()
endif()

if(NOT "${curr_tag}" STREQUAL "7f21045094191804149b36a7cea3045bba0770d9")
  execute_process(
    COMMAND "/usr/bin/git" checkout -f 7f21045094191804149b36a7cea3045bba0770d9
    WORKING_DIRECTORY "/root/koreader/base/thirdparty/sdcv/build/git_checkout/sdcv"
    RESULT_VARIABLE error_code
  )
  if(error_code)
    execute_process(
      COMMAND "/usr/bin/git" fetch
      WORKING_DIRECTORY "/root/koreader/base/thirdparty/sdcv/build/git_checkout/sdcv"
      RESULT_VARIABLE error_code
    )
    if(error_code)
      message(FATAL_ERROR "Failed to fetch update from origin")
    endif()
    execute_process(
      COMMAND "/usr/bin/git" checkout -f 7f21045094191804149b36a7cea3045bba0770d9
      WORKING_DIRECTORY "/root/koreader/base/thirdparty/sdcv/build/git_checkout/sdcv"
      RESULT_VARIABLE error_code
    )
    if(error_code)
      message(FATAL_ERROR "Failed to checkout tag: '7f21045094191804149b36a7cea3045bba0770d9'")
    endif()
  endif()
endif()

# checkout all submodules
execute_process(
  COMMAND "/usr/bin/git" submodule init 
  WORKING_DIRECTORY "/root/koreader/base/thirdparty/sdcv/build/git_checkout/sdcv"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to init submodules in: '/root/koreader/base/thirdparty/sdcv/build/git_checkout/sdcv'")
endif()

execute_process(
  COMMAND "/usr/bin/git" submodule update --recursive 
  WORKING_DIRECTORY "/root/koreader/base/thirdparty/sdcv/build/git_checkout/sdcv"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/root/koreader/base/thirdparty/sdcv/build/git_checkout/sdcv'")
endif()

# Complete success, update the script-last-run stamp file:
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/root/koreader/base/thirdparty/sdcv/build/arm-linux-gnueabi/git_checkout/stamp/sdcv-gitinfo-7f21045094191804149b36a7cea3045bba0770d9.txt"
    "/root/koreader/base/thirdparty/sdcv/build/arm-linux-gnueabi/git_checkout/stamp/sdcv-gitclone-lastrun.txt"
  WORKING_DIRECTORY "/root/koreader/base/thirdparty/sdcv/build/git_checkout/sdcv"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/root/koreader/base/thirdparty/sdcv/build/arm-linux-gnueabi/git_checkout/stamp/sdcv-gitclone-lastrun.txt'")
endif()

# Copy everything over to source directory
get_filename_component(destination_dir "/root/koreader/base/thirdparty/sdcv/build/arm-linux-gnueabi/sdcv-prefix/src/sdcv" PATH)
if(EXISTS /root/koreader/base/thirdparty/sdcv/build/arm-linux-gnueabi/sdcv-prefix/src/sdcv)
  file(REMOVE_RECURSE /root/koreader/base/thirdparty/sdcv/build/arm-linux-gnueabi/sdcv-prefix/src/sdcv)
endif()
file(COPY /root/koreader/base/thirdparty/sdcv/build/git_checkout/sdcv DESTINATION ${destination_dir})
