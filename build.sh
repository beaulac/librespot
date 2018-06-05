#!/bin/bash
export LEDE_PATH="/home/antoine/src/lede"

export STAGING_DIR="$LEDE_PATH/staging_dir/"
export LEDE_TOOLCHAIN_PATH="$STAGING_DIR/toolchain-mips_24kc_gcc-5.4.0_musl-1.1.16/bin"

export PKG_CONFIG_ALLOW_CROSS=1
export PKG_CONFIG_PATH="$STAGING_DIR/target-mips_24kc_musl-1.1.16/usr/lib/pkgconfig"
export PATH=${LEDE_TOOLCHAIN_PATH}:${PATH}

export HOST_CC=gcc
export TARGET_CC="mips-openwrt-linux-gcc"

cargo build --target mips-unknown-linux-musl --no-default-features --features "alsa-backend with-tremor" --release
