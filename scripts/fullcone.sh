#!/bin/bash

cp -r $GITHUB_WORKSPACE/plugins/fullcone/firewall/patches package/network/config/firewall
sed -i 's?+kmod-ipt-nat?+kmod-ipt-nat\ +iptables-mod-fullconenat\ ?g' package/network/config/firewall/Makefile

cp -r $GITHUB_WORKSPACE/plugins/fullcone/firewall4/patches package/network/config/firewall4
sed -i 's?+kmod-nft-nat?+kmod-nft-nat\ +kmod-nft-fullcone\ ?g' package/network/config/firewall4/Makefile

cp -r $GITHUB_WORKSPACE/plugins/fullcone/libnftnl/patches package/libs/libnftnl
sed -i 's?PKG_INSTALL:=1?PKG_FIXUP:=autoreconf\nPKG_INSTALL:=1?g' package/libs/libnftnl/Makefile

cp -r $GITHUB_WORKSPACE/plugins/fullcone/nftables/patches package/network/utils/nftables

cp -r $GITHUB_WORKSPACE/plugins/fullcone/fullconenat package/network/utils

cp -r $GITHUB_WORKSPACE/plugins/fullcone/fullconenat-nft package/network/utils
