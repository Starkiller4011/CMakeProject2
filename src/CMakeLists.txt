cmake_minimum_required(VERSION 3.20.0)
cmake_policy(SET CMP0048 NEW)
project(
    "YourProjectName"
    VERSION 000.001.001.001
    LANGUAGES C CXX
)

# Macro Definitions for getting libraries and source/header files
macro(librarylist result curdir)
  file(GLOB children RELATIVE ${curdir} ${curdir}/*)
  set(dirlist "")
  foreach(child ${children})
    if(IS_DIRECTORY ${curdir}/${child})
      list(APPEND dirlist ${child})
    endif()
  endforeach()
  set(${result} ${dirlist})
endmacro()

macro(headerlist result curdir)
  file(GLOB children RELATIVE ${curdir} ${curdir}/*.h ${curdir}/*.hpp ${curdir}/*.hxx)
  set(dirlist "")
  foreach(child ${children})
    if(NOT IS_DIRECTORY ${curdir}/${child})
      list(APPEND dirlist ${child})
    endif()
  endforeach()
  set(${result} ${dirlist})
endmacro()

macro(sourcelist result curdir)
  file(GLOB children RELATIVE ${curdir} ${curdir}/*.c ${curdir}/*.cpp ${curdir}/*.cxx)
  set(dirlist "")
  foreach(child ${children})
    if(NOT IS_DIRECTORY ${curdir}/${child})
      list(APPEND dirlist ${child})
    endif()
  endforeach()
  set(${result} ${dirlist})
endmacro()

# Set include current dir
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Set executable suffix
if(WIN32)
    set(EXECUTABLE_SUFFIX .exe)
else()
    set(EXECUTABLE_SUFFIX )
endif(WIN32)

# Create libraries list
define_property(
    GLOBAL PROPERTY LIBRARY_LIST
    BRIEF_DOCS "Global list of libraries to link"
    FULL_DOCS "Global list of libraries to link"
)
set_property(GLOBAL PROPERTY LIBRARY_LIST "")

#Set target ouput directory
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/../install/exec/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/../install/exec/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/../install/exec/bin")

# Build libraries first
add_subdirectory("lib")

# Build executables and link libraries
add_subdirectory("app")