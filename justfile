export RISC0_TOOLCHAIN := "/home/heliax/.risc0/toolchains/v2024.1.5-cpp-x86_64-unknown-linux-gnu/riscv32im-linux-x86_64"
export LEAN_RUNTIME_DIR := "/home/heliax/.lean-risc0"

build:
    lake build
    mkdir -p build/risc0_ir && rsync -a --prune-empty-dirs --include '*/' --include '*.c' --exclude '*' .lake/build/ir/ build/risc0_ir/
    cd build && make

clean:
    lake clean
    cd build && make clean
    rm -rf build/risc0_ir/
