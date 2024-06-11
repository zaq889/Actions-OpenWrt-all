#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '1i src-git  kiddin9 https://github.com/kiddin9/openwrt-packages.git' feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
./scripts/feeds update -a && ./scripts/feeds install -a
git clone https://github.com/Siriling/5G-Modem-Support.git feeds/packages/5G-Modem-Support
git clone https://github.com/animegasan/luci-app-dnsleaktest.git feeds/packages/luci-app-dnsleaktest
git clone https://github.com/sirpdboy/luci-app-chatgpt-web.git feeds/packages/luci-app-chatgpt-web
git clone https://github.com/sirpdboy/netspeedtest.git feeds/packages/netspeedtest
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git feeds/packages/luci-app-adguardhome
git clone https://github.com/sbwml/luci-app-mosdns.git feeds/packages/luci-app-mosdns
cp ../nx30pro_eeprom.bin openwrt/package/mtk/drivers/mt_wifi/files/mt7981-default-eeprom/MT7981_iPAiLNA_EEPROM.bin
cp ../banner openwrt/package/base-files/files/etc/banner
