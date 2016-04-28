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
CMAKE_SOURCE_DIR = /root/koreader/base/thirdparty/turbo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi

# Utility rule file for turbo.

# Include the progress variables for this target.
include CMakeFiles/turbo.dir/progress.make

CMakeFiles/turbo: CMakeFiles/turbo-complete

CMakeFiles/turbo-complete: turbo-prefix/src/turbo-stamp/turbo-install
CMakeFiles/turbo-complete: turbo-prefix/src/turbo-stamp/turbo-mkdir
CMakeFiles/turbo-complete: turbo-prefix/src/turbo-stamp/turbo-download
CMakeFiles/turbo-complete: turbo-prefix/src/turbo-stamp/turbo-update
CMakeFiles/turbo-complete: turbo-prefix/src/turbo-stamp/turbo-patch
CMakeFiles/turbo-complete: turbo-prefix/src/turbo-stamp/turbo-configure
CMakeFiles/turbo-complete: turbo-prefix/src/turbo-stamp/turbo-build
CMakeFiles/turbo-complete: turbo-prefix/src/turbo-stamp/turbo-install
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Completed 'turbo'"
	/usr/bin/cmake -E make_directory /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/CMakeFiles
	/usr/bin/cmake -E touch /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/CMakeFiles/turbo-complete
	/usr/bin/cmake -E touch /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo-stamp/turbo-done

turbo-prefix/src/turbo-stamp/turbo-install: turbo-prefix/src/turbo-stamp/turbo-build
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "No install step for 'turbo'"
	cd /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo && /usr/bin/cmake -E touch /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo-stamp/turbo-install

turbo-prefix/src/turbo-stamp/turbo-mkdir:
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Creating directories for 'turbo'"
	/usr/bin/cmake -E make_directory /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo
	/usr/bin/cmake -E make_directory /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo
	/usr/bin/cmake -E make_directory /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix
	/usr/bin/cmake -E make_directory /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/tmp
	/usr/bin/cmake -E make_directory /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo-stamp
	/usr/bin/cmake -E make_directory /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src
	/usr/bin/cmake -E touch /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo-stamp/turbo-mkdir

turbo-prefix/src/turbo-stamp/turbo-download: turbo-prefix/src/turbo-stamp/turbo-mkdir
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing download step for 'turbo'"
	cd /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src && /usr/bin/cmake -P /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/git_checkout/tmp/turbo-gitclone-5ccd3c7a3b57f1c3b93aefb6e756d7974e8d4c9b.cmake
	cd /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src && /usr/bin/cmake -E touch /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo-stamp/turbo-download

turbo-prefix/src/turbo-stamp/turbo-update: turbo-prefix/src/turbo-stamp/turbo-download
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "No update step for 'turbo'"
	/usr/bin/cmake -E touch /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo-stamp/turbo-update

turbo-prefix/src/turbo-stamp/turbo-patch: turbo-prefix/src/turbo-stamp/turbo-download
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing patch step for 'turbo'"
	cd /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo && patch -N -p1 < /root/koreader/base/thirdparty/turbo/turbo.patch
	cd /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo && /usr/bin/cmake -E touch /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo-stamp/turbo-patch

turbo-prefix/src/turbo-stamp/turbo-configure: turbo-prefix/tmp/turbo-cfgcmd.txt
turbo-prefix/src/turbo-stamp/turbo-configure: turbo-prefix/src/turbo-stamp/turbo-update
turbo-prefix/src/turbo-stamp/turbo-configure: turbo-prefix/src/turbo-stamp/turbo-patch
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "No configure step for 'turbo'"
	cd /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo && /usr/bin/cmake -E touch /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo-stamp/turbo-configure

turbo-prefix/src/turbo-stamp/turbo-build: turbo-prefix/src/turbo-stamp/turbo-configure
	$(CMAKE_COMMAND) -E cmake_progress_report /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing build step for 'turbo'"
	cd /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo && sh -c "$(MAKE) CC=\"arm-linux-gnueabi-gcc -static-libstdc++ -O2 -ffast-math -pipe -fomit-frame-pointer  -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mthumb -mfloat-abi=softfp -fno-finite-math-only -fno-stack-protector -U_FORTIFY_SOURCE -fPIC -I/root/koreader/base/thirdparty/openssl/build/arm-linux-gnueabi/openssl-prefix/src/openssl/include\" LDFLAGS=\"-Wl,-O1 -Wl,--as-needed -static-libstdc++ -lcrypto -lssl 		 		 		-L/root/koreader/base/thirdparty/openssl/build/arm-linux-gnueabi/openssl-prefix/src/openssl -Wl,-rpath,'\\\$$\\\$$ORIGIN/../libs'\" all"
	cd /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo && /usr/bin/cmake -E touch /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/turbo-prefix/src/turbo-stamp/turbo-build

turbo: CMakeFiles/turbo
turbo: CMakeFiles/turbo-complete
turbo: turbo-prefix/src/turbo-stamp/turbo-install
turbo: turbo-prefix/src/turbo-stamp/turbo-mkdir
turbo: turbo-prefix/src/turbo-stamp/turbo-download
turbo: turbo-prefix/src/turbo-stamp/turbo-update
turbo: turbo-prefix/src/turbo-stamp/turbo-patch
turbo: turbo-prefix/src/turbo-stamp/turbo-configure
turbo: turbo-prefix/src/turbo-stamp/turbo-build
turbo: CMakeFiles/turbo.dir/build.make
.PHONY : turbo

# Rule to build all files generated by this target.
CMakeFiles/turbo.dir/build: turbo
.PHONY : CMakeFiles/turbo.dir/build

CMakeFiles/turbo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/turbo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/turbo.dir/clean

CMakeFiles/turbo.dir/depend:
	cd /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/koreader/base/thirdparty/turbo /root/koreader/base/thirdparty/turbo /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi /root/koreader/base/thirdparty/turbo/build/arm-linux-gnueabi/CMakeFiles/turbo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/turbo.dir/depend
