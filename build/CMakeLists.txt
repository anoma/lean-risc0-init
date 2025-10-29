cmake_minimum_required(VERSION 3.18)
project(lean-init C CXX)
set(LEAN_RISC0_RUNTIME "$ENV{LEAN_RISC0_RUNTIME}" CACHE STRING "Lean RISC0 runtime path")

file(GLOB_RECURSE SRC_C CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/risc0_ir/*.c")
file(GLOB_RECURSE SRC_CPP CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/risc0_ir/*.cpp")

add_library(Init STATIC ${SRC_C} ${SRC_CPP})

target_include_directories(Init PUBLIC
  $<BUILD_INTERFACE:${LEAN_RISC0_RUNTIME}/include>
)

set(CMAKE_C_FLAGS "-ffunction-sections -fdata-sections -fPIC -march=rv32im -mabi=ilp32 -O3 -ffreestanding -fno-builtin")
set(CMAKE_CXX_FLAGS "-ffunction-sections -fdata-sections -fPIC -march=rv32im -mabi=ilp32 -O3 -ffreestanding -fno-builtin -fno-exceptions -fno-rtti -fno-threadsafe-statics")
