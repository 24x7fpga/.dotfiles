
if(NOT "/home/kiran/.config/emacs/elpaca/builds/vterm/build/libvterm-prefix/src/libvterm-stamp/libvterm-gitinfo.txt" IS_NEWER_THAN "/home/kiran/.config/emacs/elpaca/builds/vterm/build/libvterm-prefix/src/libvterm-stamp/libvterm-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/home/kiran/.config/emacs/elpaca/builds/vterm/build/libvterm-prefix/src/libvterm-stamp/libvterm-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/home/kiran/.config/emacs/elpaca/builds/vterm/build/libvterm-prefix/src/libvterm"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/kiran/.config/emacs/elpaca/builds/vterm/build/libvterm-prefix/src/libvterm'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"  clone --no-checkout --config "advice.detachedHead=false" "https://github.com/Sbozzolo/libvterm-mirror.git" "libvterm"
    WORKING_DIRECTORY "/home/kiran/.config/emacs/elpaca/builds/vterm/build/libvterm-prefix/src"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/Sbozzolo/libvterm-mirror.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git"  checkout 64f1775952dbe001e989f2ab679563b54f2fca55 --
  WORKING_DIRECTORY "/home/kiran/.config/emacs/elpaca/builds/vterm/build/libvterm-prefix/src/libvterm"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: '64f1775952dbe001e989f2ab679563b54f2fca55'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/bin/git"  submodule update --recursive --init 
    WORKING_DIRECTORY "/home/kiran/.config/emacs/elpaca/builds/vterm/build/libvterm-prefix/src/libvterm"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/home/kiran/.config/emacs/elpaca/builds/vterm/build/libvterm-prefix/src/libvterm'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/home/kiran/.config/emacs/elpaca/builds/vterm/build/libvterm-prefix/src/libvterm-stamp/libvterm-gitinfo.txt"
    "/home/kiran/.config/emacs/elpaca/builds/vterm/build/libvterm-prefix/src/libvterm-stamp/libvterm-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/kiran/.config/emacs/elpaca/builds/vterm/build/libvterm-prefix/src/libvterm-stamp/libvterm-gitclone-lastrun.txt'")
endif()

