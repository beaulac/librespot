#!/bin/bash
export LEDE_PATH="/home/antoine/src/lede"
export LEDE_STAGING_PATH="$LEDE_PATH/staging_dir/"
export LEDE_TOOLCHAIN_PATH="$LEDE_STAGING_PATH/toolchain-mips_24kc_gcc-5.4.0_musl-1.1.16/bin"
export LEDE_LIBS_PATH="$LEDE_STAGING_PATH/target-mips_24kc_musl-1.1.16/usr"

export PKG_CONFIG_ALLOW_CROSS=1
export PKG_CONFIG_PATH="${LEDE_STAGING_PATH}/target-mips_24kc_musl-1.1.16/usr/lib/pkgconfig"
export PATH=${LEDE_TOOLCHAIN_PATH}:${PATH}

export HOST_CC=gcc
export TARGET_CC="mips-openwrt-linux-gcc"

cargo build -v --target mips-unknown-linux-musl --no-default-features --features "alsa-backend with-tremor" --release 
