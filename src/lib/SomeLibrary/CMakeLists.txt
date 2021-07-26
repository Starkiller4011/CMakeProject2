cmake_minimum_required(VERSION 3.20.0)
cmake_policy(SET CMP0048 NEW)
project(
    "SomeLibrary"
    VERSION 000.001.001.001
    LANGUAGES C CXX
)

message("Working on project ${PROJECT_NAME}")

set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Create library sources list
define_property(
    GLOBAL PROPERTY "${PROJECT_NAME}_LIST"
    BRIEF_DOCS "Global list of libraries to link"
    FULL_DOCS "Global list of libraries to link"
)
set_property(GLOBAL PROPERTY "${PROJECT_NAME}_LIST" "")
