#!/bin/bash
#
# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}

# mosdns
git_sparse_clone v5  https://github.com/sbwml/luci-app-mosdns luci-app-mosdns
git_sparse_clone v5  https://github.com/sbwml/luci-app-mosdns mosdns
git_sparse_clone v5  https://github.com/sbwml/luci-app-mosdns v2dat

# Modify default IP
sed -i 's/192.168.1.1/192.168.50.10/g' package/base-files/files/bin/config_generate

#Modify default logo
sed -i 's/ImmortalWrt/OpenWrt/g' package/base-files/files/bin/config_generate

#Openclash Core
chmod +x $GITHUB_WORKSPACE/scripts/openclash_core.sh
$GITHUB_WORKSPACE/scripts/openclash_core.sh

./scripts/feeds update -a
./scripts/feeds install -a

echo "immortalwrt_script.sh executed successfully."
