# project
set(NAME "{{project-name}}")
cmake_minimum_required(VERSION 3.10)
project(${NAME} CXX)

# cmake variable
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 26)

# enable LTO on release
# if(CMAKE_BUILD_TYPE MATCHES 'Release')
#   set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
# endif()

# src
file(GLOB_RECURSE SRC src/*.cpp)
{% if crate_type == "bin" %}add_executable(${NAME} ${SRC}){% endif %}{% if crate_type == "lib" %}add_library(${NAME} ${SRC}){% endif %}

# headers
target_include_directories(${NAME} PUBLIC include/)

# options 
# target_link_options(${NAME} PRIVATE -static-libgcc -static-libstdc++)

# macro
# target_compile_definitions(${NAME} PRIVATE WLR_USE_UNSTABLE)

# add third party dependencies here

# add a subdirectory:
# add_subdirectory(./vendor/hierro2d-cpp)
# target_link_libraries(${NAME} PUBLIC hierro)

# pkg-config example:
# find_package(PkgConfig REQUIRED)
# pkg_check_modules(WLROOTS REQUIRED wlroots-0.19)
# target_link_libraries(${NAME} PRIVATE ${WLROOTS_LIBRARIES})
# target_include_directories(${NAME} PRIVATE ${WLROOTS_INCLUDE_DIRS})
