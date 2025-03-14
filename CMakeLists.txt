# project
set(name "{{project-name}}")
cmake_minimum_required(VERSION 3.10)
project(${name} CXX)

# clang setting
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
# set(CMAKE_CXX_COMPILER "/usr/bin/clang++" CACHE STRING "C++ compiler" FORCE)
set(CMAKE_CXX_STANDARD 26)

# src
file(GLOB_RECURSE SRC src/*.cpp)
{% if crate_type == "bin" %}add_executable(${name} ${SRC}){% endif %}{% if crate_type == "lib" %}add_library(${name} ${SRC}){% endif %}

# link std library staticly
# target_link_options(${name} PRIVATE -static-libgcc -static-libstdc++)

# include header
target_include_directories(${name} PUBLIC include/)

# add third party dependencies here
# add_subdirectory(./third-party/hierro2d-cpp)
# target_link_libraries(${name} PUBLIC hierro)
