name := `cat build/CMakeCache.txt | grep CMAKE_PROJECT_NAME | awk -F '=' '{print $2}'` 

run:
  just init
  just build
  ./build/{{name}}

init:
  cmake -B build

build:
  cmake --build build

clean:
  rm -rf build
