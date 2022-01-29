#!/usr/bin/env bash

SCRIPTDIR="$(readlink -f $0)"
SCRIPTDIR="$(dirname "${SCRIPTDIR}")"

export CC_FOR_TARGET="clang --target=x86_64-scei-ps4-elf -ffreestanding"
export AR_FOR_TARGET=llvm-ar
export RANLIB_FOR_TARGET=llvm-ranlib

mkdir -p build || exit 1
cd build || exit 1
$SCRIPTDIR/configure --prefix=$SCRIPTDIR/target \
		     --target=x86_64-ps4-elf \
		     --disable-libcc1 \
		     --disable-libssp \
		     --disable-multilib \
		     --disable-nls \
		     --disable-shared \
		     --disable-win32-registry || exit 1
make || exit 1
make install

