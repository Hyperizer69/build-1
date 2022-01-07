#!/bin/bash
cd /tmp/rom

. build/envsetup.sh
lunch cafex_juice-userdebug
curl -s https://api.telegram.org/$TG_TOKEN/sendMessage -d chat_id=$TG_CHAT_ID -d text="$(echo "${var_cache_report_config}")"
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
export ALLOW_MISSING_DEPENDENCIES=true
export SELINUX_IGNORE_NEVERALLOW=true
export BUILD_USERNAME=mobxprjkt
export BUILD_HOSTNAME=yoviie
ccache -M 20G
ccache -o compression=true
ccache -z
m cafex -j8
