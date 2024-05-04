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
sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
./scripts/feeds install -a 
git clone https://github.com/zaq889/5G-Modem-Support.git feeds/packages/5G-Modem-Support
git clone https://github.com/animegasan/luci-app-dnsleaktest.git feeds/packages/luci-app-dnsleaktest
# git clone https://github.com/animegasan/luci-app-speedtest.git feeds/packages/luci-app-speedtest
#sed -i '3i echo 90 > /sys/class/hwmon/hwmon1/pwm1' package/base-files/files/etc/rc.local
#sed -i '3i # echo "0e8d 7127" >> /sys/bus/usb-serial/drivers/generic/new_id' package/base-files/files/etc/rc.local
#sed -i '3i # echo "0e8d 7127" >> /sys/bus/usb-serial/drivers/generic/new_id' package/base-files/files/etc/rc.local
