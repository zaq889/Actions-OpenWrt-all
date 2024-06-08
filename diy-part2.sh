#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.6.1/192.168.15.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/ImmortalWrt/zaq889/g' package/base-files/files/bin/config_generate

# 修改wifi名称（mtwifi-cfg）
sed -i 's/ImmortalWrt-2.4G/my mobile XR30/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i 's/ImmortalWrt-5G/my mobile number is XR30/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh

#修改闪存为512M版本(这是针对原厂128闪存来的，但又要编译512M固件来的）
sed -i 's/<0x580000 0x7200000>/<0x580000 0x1e000000>/g' target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-cmcc-rax3000m.dts
sed -i 's/116736k/480m/g' target/linux/mediatek/image/mt7981.mk
sed -i 's/<0x580000 0x6e80000>/<0x580000 0x1e000000>/g' target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-jcg-q30.dts
sed -i 's/114816k/474272k/g' target/linux/mediatek/image/mt7981.mk


