run:
  just init
  just build
  ./build/$(cat build/CMakeCache.txt | grep CMAKE_PROJECT_NAME | awk -F '=' '{print $2}')

init:
  cmake -B build

build:
  cmake --build build

clean:
  rm -rf build
