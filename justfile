build:
    lake build
    mkdir -p build/risc0_ir && rsync -a --prune-empty-dirs --include '*/' --include '*.c' --exclude '*' .lake/build/ir/ build/risc0_ir/
    cd build && just build

install: build
    cd build && just install

clean:
    lake clean
    cd build && just clean
    rm -rf build/risc0_ir/
