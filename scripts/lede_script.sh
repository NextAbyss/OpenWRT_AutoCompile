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

git_sparse_clone master https://github.com/vernesong/OpenClash luci-app-openclash
git_sparse_clone main https://github.com/sirpdboy/luci-app-ddns-go ddns-go
git_sparse_clone main https://github.com/sirpdboy/luci-app-ddns-go luci-app-ddns-go

# mosdns
git_sparse_clone v5  https://github.com/sbwml/luci-app-mosdns luci-app-mosdns
git_sparse_clone v5  https://github.com/sbwml/luci-app-mosdns mosdns
git_sparse_clone v5  https://github.com/sbwml/luci-app-mosdns v2dat

# udp2raw
git_sparse_clone master https://github.com/immortalwrt/packages net/udp2raw
git_sparse_clone master https://github.com/immortalwrt/luci applications/luci-app-udp2raw
#sed -i 's?../../luci.mk?$(TOPDIR)/feeds/luci/luci.mk?g' package/luci-app-udp2raw/Makefile

# Modify default IP
sed -i 's/192.168.1.1/192.168.50.10/g' package/base-files/files/bin/config_generate

# 修改时区为CST-8,Asia/Shanghai
sed -i "315s/UTC'/CST-8'\\n\\t\\tset system.@system\[-1\].zonename=\'Asia\/Shanghai\'/" package/base-files/files/bin/config_generate

chmod +x $GITHUB_WORKSPACE/scripts/*
$GITHUB_WORKSPACE/scripts/openclash_core.sh

./scripts/feeds update -a
./scripts/feeds install -a
