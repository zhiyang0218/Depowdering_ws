cmake_minimum_required(VERSION 3.5`)

project(test_microscan_linux_sdk)

# Method 2: # - Try to find LiBARAVIS by using path hints from pkg-config
# Once done this will define
#  LIBARAVIS_FOUND - System has LiBARAVIS
#  LIBARAVIS_INCLUDE_DIRS - The LiBARAVIS include directories
#  LIBARAVIS_LIBRARIES - The libraries needed to use LiBARAVIS
#  LIBARAVIS_DEFINITIONS - Compiler switches required for using LiBARAVIS
find_package(PkgConfig REQUIRED)

pkg_check_modules(PC_LIBARAVIS REQUIRED aravis-0.4) # use <package_name>.pc 
set(LIBARAVIS_DEFINITION ${PC_LIBARAVIS_CFLAGS_OTHER})

find_path(LIBARAVIS_INCLUDE_DIR aravis-0.4/arv.h 
          HINTS ${PC_LIBARAVIS_INCLUDEDIR} ${PC_LIBARAVIS_INCLUDE_DIRS}
          PATH_SUFFIXES libaravis)

find_path(LIBARAVIS_LIBRARY_DIR libaravis-0.4.so
          HINTS ${PC_LIBARAVIS_LIBDIR} ${PC_LIBARAVIS_LIBRARY_DIRS})

# This one finds the the shared object, not the directory
find_library(LIBARAVIS_LIBRARY libaravis-0.4.so
             HINTS ${PC_LIBARAVIS_LIBDIR} ${PC_LIBARAVIS_LIBRARY_DIRS})

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBARAVIS_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(aravis-0.4  DEFAULT_MSG
                                  LIBARAVIS_LIBRARY LIBARAVIS_INCLUDE_DIR)

mark_as_advanced(LIBARAVIS_INCLUDE_DIR LIBARAVIS_LIBRARY )

set(LIBARAVIS_LIBRARIES ${LIBARAVIS_LIBRARY} )
set(LIBARAVIS_INCLUDE_DIRS ${LIBARAVIS_INCLUDE_DIR} )
set(LIBARAVIS_LIBRARY_DIRS ${LIBARAVIS_LIBRARY_DIR} )

# Method 3: directly use information provided by pkg-config
pkg_search_module(GLIB REQUIRED glib-2.0)


# Method 1: Directly include the include & library directory if you know where to find them
#set(INCLUDE_DIR binaries_x86_64/libllt/ binaries_x86_64/libmescan/ /usr/local/include/aravis-0.4)
#set(LINK_DIR binaries_x86_64/libllt/ binaries_x86_64/libmescan/ /usr/local/lib)
set(INCLUDE_DIR 
    binaries_x86_64/libllt/ 
    binaries_x86_64/libmescan/ 
    ${LIBARAVIS_INCLUDE_DIRS}/aravis-0.4
    ${GLIB_INCLUDE_DIRS})

set(LINK_DIR binaries_x86_64/libllt/ 
    binaries_x86_64/libmescan/ 
    ${LIBARAVIS_LIBRARY_DIRS})

include_directories(${INCLUDE_DIR})
link_directories(${LINK_DIR})

set(SRC examples/GetProfilesCallback/GetProfilesCallback.cpp)
set(LINK_LIB pthread ${GLIB_LDFLAGS} xml2 gthread-2.0 gio-2.0 gobject-2.0 m llt aravis-0.4 mescan )

add_executable(${PROJECT_NAME} ${SRC})

target_link_libraries(${PROJECT_NAME} ${LINK_LIB})
