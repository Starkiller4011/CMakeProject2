#!/usr/bin/env bash

# Check number of args is valid, no args should be passed
if [ $# -gt 0 ]; then
    echo -e "Invalids number of arguments, no args should be passed.\n"
    exit 1
fi

# Conduct complete clean build everytime
# Remove build and install directories
if [ -d "build" ]; then
    rm -Rf build
fi
if [ -d "install" ]; then
    rm -Rf install
fi
# Create build and install directories
mkdir -p install/exec/bin install/exec/lib build

# Build project
cmake -S src -B build

# Compile and link project
make -C build

# Clean up build folder
# rm -Rf build