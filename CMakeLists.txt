cmake_minimum_required(VERSION 3.22)

project(
    "CppTemplate"
    VERSION 1.0.0
    LANGUAGES C CXX
)

set(CMAKE_CXX_STANDARD          17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS        OFF)

set(EXECUTABLE_NAME "ConsoleApp")

option(ENABLE_WARNINGS "Enable warnings" ON)
option(ENABLE_WARNINGS_AS_ERRORS "Enable warnings as errors" OFF)

option(ENABLE_LTO "Enable Link Time Optimization" ON)

option(ENABLE_SANITIZE_ADR "Enable address sanitizer" ON)
option(ENABLE_SANITIZE_UNDEF "Enable undefined sanitizer" ON)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(FetchContent)
include(ConfigSafeGuards)

if(ENABLE_WARNINGS)
    include(Warnings)
endif()

if(ENABLE_SANITIZE_ADR OR ENABLE_SANITIZE_UNDEF)
    include(Sanitizers)
    add_sanitizer_flag()
endif()

if(ENABLE_LTO)
    include(LTO)
endif()

add_subdirectory(src)
add_subdirectory(app)