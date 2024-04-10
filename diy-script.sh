#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt

# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}


# 移植master分支的包至23.05.2分支解决defconfig报错
rm -rf feeds/packages/lang/python/pymysql
rm -rf feeds/packages/lang/golang
git_sparse_clone master https://github.com/openwrt/packages lang/python/pymysql
git_sparse_clone master https://github.com/openwrt/packages lang/golang
mv package/golang feeds/packages/lang
mv package/pymysql feeds/packages/lang/python

git_sparse_clone master https://github.com/kenzok8/openwrt-packages luci-app-openclash
git_sparse_clone master https://github.com/kenzok8/openwrt-packages ddns-go
git_sparse_clone master https://github.com/kenzok8/openwrt-packages luci-app-ddns-go

#argon theme
rm -rf feeds/luci/themes/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

git_sparse_clone master https://github.com/immortalwrt/immortalwrt package/emortal/cpufreq
git_sparse_clone master https://github.com/immortalwrt/immortalwrt package/emortal/autocore
git_sparse_clone master https://github.com/immortalwrt/immortalwrt package/utils/bcm27xx-utils
git_sparse_clone master https://github.com/immortalwrt/immortalwrt package/emortal/autosamba
git_sparse_clone master https://github.com/immortalwrt/immortalwrt package/emortal/automount

# mosdns
git_sparse_clone v5  https://github.com/sbwml/luci-app-mosdns luci-app-mosdns
git_sparse_clone v5  https://github.com/sbwml/luci-app-mosdns mosdns
git_sparse_clone v5  https://github.com/sbwml/luci-app-mosdns v2dat

# amule
git_sparse_clone master https://github.com/immortalwrt/packages net/amule
git_sparse_clone master https://github.com/immortalwrt/packages libs/antileech
git_sparse_clone master https://github.com/immortalwrt/luci applications/luci-app-amule
sed -i 's?..\/..\/luci.mk?$(TOPDIR)\/feeds\/luci\/luci.mk?g' package/luci-app-amule/Makefile
git_sparse_clone master https://github.com/immortalwrt/packages libs/libcryptopp
cp -r $GITHUB_WORKSPACE/plugins/libwxbase package
LIBWXWIDGETS_VERSION=$(curl -sL https://api.github.com/repos/wxWidgets/wxWidgets/releases/latest | grep -E 'tag_name\": \"v[0-9]+\.[0-9]+\.[0-9]+' -o | head -n 1 | tr -d 'tag_name\": \:'|sed 's?v??g')
sed -i 's/PKG_VERSION:=/PKG_VERSION:='"${LIBWXWIDGETS_VERSION}"'/g' package/libwxbase/Makefile

# qbittorrent
cp -r $GITHUB_WORKSPACE/plugins/luci-app-qbittorrent package
cp -r $GITHUB_WORKSPACE/plugins/qbittorrent package
#git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-qbittorrent
#git_sparse_clone master https://github.com/immortalwrt/packages net/qBittorrent-Enhanced-Edition
#git_sparse_clone master https://github.com/immortalwrt/luci applications/luci-app-qbittorrent
git_sparse_clone master https://github.com/kiddin9/openwrt-packages qt6base
git_sparse_clone master https://github.com/kiddin9/openwrt-packages qt6tools
git_sparse_clone master https://github.com/kiddin9/openwrt-packages libdouble-conversion
#sed -i 's/LUCI_DEPENDS:=+qbittorrent-enhanced-edition/LUCI_DEPENDS:=+qbittorrent/g' package/luci-app-qbittorrent/Makefile

# libtorrent
rm -rf feeds/packages/libs/libtorrent-rasterbar
cp -r $GITHUB_WORKSPACE/plugins/libtorrent-rasterbar feeds/packages/libs
LIBTORRENT_VERSION=$(curl -sL https://api.github.com/repos/arvidn/libtorrent/releases/latest | grep -E 'tag_name\": \"v[0-9]+\.[0-9]+\.[0-9]+' -o | head -n 1 | tr -d 'tag_name\": \:'|sed 's?v??g')
sed -i 's/PKG_VERSION:=/PKG_VERSION:='"${LIBTORRENT_VERSION}"'/g' feeds/packages/libs/libtorrent-rasterbar/Makefile

# Modify default IP
sed -i 's/192.168.1.1/192.168.50.3/g' package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 修改时区为CST-8,Asia/Shanghai
sed -i "315s/UTC'/CST-8'\\n\\t\\tset system.@system\[-1\].zonename=\'Asia\/Shanghai\'/" package/base-files/files/bin/config_generate

chmod +x $GITHUB_WORKSPACE/scripts/*
$GITHUB_WORKSPACE/scripts/fullcone.sh
$GITHUB_WORKSPACE/scripts/clash-core.sh

./scripts/feeds update -a
./scripts/feeds install -a
