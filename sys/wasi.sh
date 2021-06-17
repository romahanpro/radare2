#!/bin/sh

export WASI_SDK=${HOME}/Downloads/wasi/wasi-sdk-12.0
export WASI_SYSROOT=${HOME}/Downloads/wasi/wasi-sysroot

export CFLAGS=-D_WASI_EMULATED_SIGNAL

cp dist/plugins-cfg/plugins.wasi.cfg plugins.cfg

# export CC="${WASI_SDK}/bin/clang -D
./configure --with-compiler=wasi --disable-debugger --without-fork --with-ostype=wasi --with-checks-level=0 --disable-threads --without-dylink --with-libr --without-libuv --without-gpl
make -j
make -C binr/rax2 wasi
make -C binr/radare2 wasi
make -C binr/rasm2 wasi
make -C binr/rabin2 wasi
make -C binr/rafind2 wasi
