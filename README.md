# remarkable_lua

Makefile for cross-compiling Lua static binaries for the reMarkable tablet.

## Dependencies

`arm-linux-gnueabihf-gcc` is required

Fedora/RHEL/CentOS

    sudo dnf install arm-linux-gnueabihf
    
Debian/Ubuntu

    sudo apt install gcc-arm-linux-gnueabihf

## Usage

Building `main.lua` for reMarkable

    make
    scp main root@10.11.99.1:
    
Building `main.lua` on host system.  (Use `make clean-all` when rebuilding for a different architecture.)

    make CC=gcc
    ./main
