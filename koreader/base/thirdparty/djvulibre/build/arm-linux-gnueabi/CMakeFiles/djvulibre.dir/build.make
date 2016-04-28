# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/koreader/base/thirdparty/djvulibre

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi

# Utility rule file for djvulibre.

# Include the progress variables for this target.
include CMakeFiles/djvulibre.dir/progress.make

CMakeFiles/djvulibre: CMakeFiles/djvulibre-complete

CMakeFiles/djvulibre-complete: djvulibre-prefix/src/djvulibre-stamp/djvulibre-install
CMakeFiles/djvulibre-complete: djvulibre-prefix/src/djvulibre-stamp/djvulibre-mkdir
CMakeFiles/djvulibre-complete: djvulibre-prefix/src/djvulibre-stamp/djvulibre-download
CMakeFiles/djvulibre-complete: djvulibre-prefix/src/djvulibre-stamp/djvulibre-update
CMakeFiles/djvulibre-complete: djvulibre-prefix/src/djvulibre-stamp/djvulibre-patch
CMakeFiles/djvulibre-complete: djvulibre-prefix/src/djvulibre-stamp/djvulibre-configure
CMakeFiles/djvulibre-complete: djvulibre-prefix/src/djvulibre-stamp/djvulibre-build
CMakeFiles/djvulibre-complete: djvulibre-prefix/src/djvulibre-stamp/djvulibre-install
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Completed 'djvulibre'"
	/usr/bin/cmake -E make_directory /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/CMakeFiles
	/usr/bin/cmake -E touch /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/CMakeFiles/djvulibre-complete
	/usr/bin/cmake -E touch /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre-stamp/djvulibre-done

djvulibre-prefix/src/djvulibre-stamp/djvulibre-install: djvulibre-prefix/src/djvulibre-stamp/djvulibre-build
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "No install step for 'djvulibre'"
	cd /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre && /usr/bin/cmake -E touch /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre-stamp/djvulibre-install

djvulibre-prefix/src/djvulibre-stamp/djvulibre-mkdir:
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Creating directories for 'djvulibre'"
	/usr/bin/cmake -E make_directory /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre
	/usr/bin/cmake -E make_directory /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre
	/usr/bin/cmake -E make_directory /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix
	/usr/bin/cmake -E make_directory /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/tmp
	/usr/bin/cmake -E make_directory /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre-stamp
	/usr/bin/cmake -E make_directory /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src
	/usr/bin/cmake -E touch /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre-stamp/djvulibre-mkdir

djvulibre-prefix/src/djvulibre-stamp/djvulibre-download: djvulibre-prefix/src/djvulibre-stamp/djvulibre-mkdir
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing download step for 'djvulibre'"
	cd /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src && /usr/bin/cmake -P /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/git_checkout/tmp/djvulibre-gitclone-070fef721a8e8fdf68c4b0e3fcf0a179c804d818.cmake
	cd /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src && /usr/bin/cmake -E touch /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre-stamp/djvulibre-download

djvulibre-prefix/src/djvulibre-stamp/djvulibre-update: djvulibre-prefix/src/djvulibre-stamp/djvulibre-download
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "No update step for 'djvulibre'"
	/usr/bin/cmake -E touch /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre-stamp/djvulibre-update

djvulibre-prefix/src/djvulibre-stamp/djvulibre-patch: djvulibre-prefix/src/djvulibre-stamp/djvulibre-download
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing patch step for 'djvulibre'"
	cd /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre && NOCONFIGURE=1 ./autogen.sh
	cd /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre && /usr/bin/cmake -E touch /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre-stamp/djvulibre-patch

djvulibre-prefix/src/djvulibre-stamp/djvulibre-configure: djvulibre-prefix/tmp/djvulibre-cfgcmd.txt
djvulibre-prefix/src/djvulibre-stamp/djvulibre-configure: djvulibre-prefix/src/djvulibre-stamp/djvulibre-update
djvulibre-prefix/src/djvulibre-stamp/djvulibre-configure: djvulibre-prefix/src/djvulibre-stamp/djvulibre-patch
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing configure step for 'djvulibre'"
	cd /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre && sh -c "CC=\"arm-linux-gnueabi-gcc -static-libstdc++\" CXX=\"arm-linux-gnueabi-g++ -static-libstdc++\" CFLAGS=\"-O2 -ffast-math -pipe -fomit-frame-pointer  -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mthumb -mfloat-abi=softfp -fno-finite-math-only -fno-stack-protector -U_FORTIFY_SOURCE -fPIC\" CXXFLAGS=\"-O2 -ffast-math -pipe -fomit-frame-pointer  -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mthumb -mfloat-abi=softfp -fno-finite-math-only -fno-stack-protector -U_FORTIFY_SOURCE -fPIC\" LDFLAGS=\"-Wl,-O1 -Wl,--as-needed -static-libstdc++\" LIBS=\"/usr/lib/gcc-cross/arm-linux-gnueabi/4.7/libstdc++.a\" /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre/configure -q --disable-desktopfiles --disable-static --enable-shared --disable-xmltools --disable-largefile --without-jpeg --without-tiff -host=\"arm-linux-gnueabi\""
	cd /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre && sh -c "sed -i -e \"s|-lstdc++||g\" libtool"
	cd /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre && /usr/bin/cmake -E touch /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre-stamp/djvulibre-configure

djvulibre-prefix/src/djvulibre-stamp/djvulibre-build: djvulibre-prefix/src/djvulibre-stamp/djvulibre-configure
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing build step for 'djvulibre'"
	cd /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre && $(MAKE) -j2 SUBDIRS_FIRST=libdjvu --silent
	cd /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre && /usr/bin/cmake -E touch /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/djvulibre-prefix/src/djvulibre-stamp/djvulibre-build

djvulibre: CMakeFiles/djvulibre
djvulibre: CMakeFiles/djvulibre-complete
djvulibre: djvulibre-prefix/src/djvulibre-stamp/djvulibre-install
djvulibre: djvulibre-prefix/src/djvulibre-stamp/djvulibre-mkdir
djvulibre: djvulibre-prefix/src/djvulibre-stamp/djvulibre-download
djvulibre: djvulibre-prefix/src/djvulibre-stamp/djvulibre-update
djvulibre: djvulibre-prefix/src/djvulibre-stamp/djvulibre-patch
djvulibre: djvulibre-prefix/src/djvulibre-stamp/djvulibre-configure
djvulibre: djvulibre-prefix/src/djvulibre-stamp/djvulibre-build
djvulibre: CMakeFiles/djvulibre.dir/build.make
.PHONY : djvulibre

# Rule to build all files generated by this target.
CMakeFiles/djvulibre.dir/build: djvulibre
.PHONY : CMakeFiles/djvulibre.dir/build

CMakeFiles/djvulibre.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/djvulibre.dir/cmake_clean.cmake
.PHONY : CMakeFiles/djvulibre.dir/clean

CMakeFiles/djvulibre.dir/depend:
	cd /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/koreader/base/thirdparty/djvulibre /root/koreader/base/thirdparty/djvulibre /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi /root/koreader/base/thirdparty/djvulibre/build/arm-linux-gnueabi/CMakeFiles/djvulibre.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/djvulibre.dir/depend

