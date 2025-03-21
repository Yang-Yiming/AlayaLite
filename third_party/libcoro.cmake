FetchContent_Declare(
    libcoro
    GIT_REPOSITORY https://github.com/jbaldwin/libcoro.git
    GIT_TAG v0.14.1
)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_BAK ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libcoro-bin)

FetchContent_MakeAvailable(libcoro)
set(LIBCORO_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(LIBCORO_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(LIBCORO_FEATURE_NETWORKING OFF CACHE BOOL "" FORCE)
set(LIBCORO_FEATURE_TLS OFF CACHE BOOL "" FORCE)

set_target_properties(libcoro PROPERTIES INTERFACE_COMPILE_OPTIONS "")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY_BAK})
