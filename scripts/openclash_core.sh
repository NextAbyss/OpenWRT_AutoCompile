#!/bin/bash

mkdir -p files/etc/openclash/core
CLASH_TUN_VERSION=$(curl -sL https://api.github.com/repos/MetaCubeX/mihomo/releases/latest | grep -E 'tag_name\": \"v[0-9]+\.[0-9]+\.[0-9]+' -o | head -n 1 | tr -d 'tag_name\": \:')
CLASH_TUN_URL="https://github.com/MetaCubeX/mihomo/releases/download/$CLASH_TUN_VERSION/mihomo-linux-amd64-$CLASH_TUN_VERSION.gz"
GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"

wget -qO- $CLASH_TUN_URL | gzip -d > files/etc/openclash/core/clash_meta
wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat

chmod +x files/etc/openclash/core/clash_meta

echo "openclash_core.sh executed successfully."
