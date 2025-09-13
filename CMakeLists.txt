# Project
# -----------------------------------------------------------------------------
set(NAME "{{project-name}}")
set(VERSION 0.1.0)
cmake_minimum_required(VERSION 3.10)
project(${NAME} VERSION ${VERSION} LANGUAGES CXX)

# Compiler and Build Options
# -----------------------------------------------------------------------------
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 26)

# enable LTO on release
# if(CMAKE_BUILD_TYPE MATCHES 'Release')
#   set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
# endif()

# Source Files
# -----------------------------------------------------------------------------
file(GLOB_RECURSE SRC src/*.cpp)
{% if crate_type == "bin" %}add_executable(${NAME} ${SRC}){% endif %}{% if crate_type == "lib" %}add_library(${NAME} ${SRC}){% endif %}


# Headers
# -----------------------------------------------------------------------------
target_include_directories(${NAME} PUBLIC include/)

# Options and Definitions
# -----------------------------------------------------------------------------
# target_link_options(${NAME} PRIVATE -static-libgcc -static-libstdc++)
# target_compile_definitions(${NAME} PRIVATE WLR_USE_UNSTABLE)

string(TOUPPER "${NAME}" UPPER_NAME)
string(REPLACE "-" "_" UPPER_NAME ${UPPER_NAME})
set(VERSION_MACRO_NAME "${UPPER_NAME}_PROJECT_VERSION")
target_compile_definitions(${NAME} PRIVATE ${VERSION_MACRO_NAME}="${VERSION}")

# Dependencies
# -----------------------------------------------------------------------------
# add third party dependencies here

# subdirectory example:
# add_subdirectory(./vendor/hierro2d-cpp)
# target_link_libraries(${NAME} PRIVATE hierro)

# pkg-config example:
# find_package(PkgConfig REQUIRED)
# pkg_check_modules(WLROOTS REQUIRED wlroots-0.19)
# target_link_libraries(${NAME} PRIVATE ${WLROOTS_LIBRARIES})
# target_include_directories(${NAME} PRIVATE ${WLROOTS_INCLUDE_DIRS})

# fetch_content example:
# include(FetchContent)
# FetchContent_Declare(
# "hierro"
# GIT_REPOSITORY https://github.com/levinion/hierro
# GIT_TAG main
# )
# FetchContent_MakeAvailable("hierro")
# target_link_libraries(${NAME} PRIVATE hierro)
