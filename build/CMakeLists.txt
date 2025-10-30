cmake_minimum_required(VERSION 3.18)
project(lean-risc0-init C)
set(LEAN_RISC0_PATH "$ENV{LEAN_RISC0_PATH}" CACHE STRING "Lean RISC0 runtime path")

file(GLOB_RECURSE SRC_C CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/risc0_ir/*.c")

add_library(Init STATIC ${SRC_C})

target_include_directories(Init PUBLIC
  $<BUILD_INTERFACE:${LEAN_RISC0_PATH}/include>
)
target_compile_features(Init PUBLIC c_std_11)

install(TARGETS Init
    EXPORT InitTargets
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

set(CMAKE_C_FLAGS "-DNDEBUG -ffunction-sections -fdata-sections -fPIC -march=rv32im -mabi=ilp32 -O3 -ffreestanding -fno-builtin -fno-exceptions")
