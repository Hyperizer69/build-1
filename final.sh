#!/bin/bash
cd /tmp/rom

. build/envsetup.sh
lunch dot_juice-userdebug
curl -s https://api.telegram.org/$TG_TOKEN/sendMessage -d chat_id=$TG_CHAT_ID -d text="$(echo "${var_cache_report_config}")"
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
export BUILD_USERNAME=mobxprjkt
export BUILD_HOSTNAME=c3eru
export WITH_GAPPS=true
ccache -M 20G
ccache -o compression=true
ccache -z
make bacon -j8
