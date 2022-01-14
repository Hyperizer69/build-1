#!/bin/bash
cd /tmp/rom

. build/envsetup.sh
lunch aosp_juice-userdebug

export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
export ALLOW_MISSING_DEPENDENCIES=true
export SELINUX_IGNORE_NEVERALLOW=true

ccache -M 20G
ccache -o compression=true
ccache -z

m rohie -j8 &

sleep 90m
kill %1
ccache -s
