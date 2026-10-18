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
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
#!/bin/bash
#
# https://github.com
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 1. 强行删除导致编译直接中断报错（ERROR: package/feeds/small/geoview failed to build）的 Bug 插件
rm -rf feeds/small/geoview
rm -rf feeds/packages/net/geoview

# 2. 强行删除引发 Kconfig 循环依赖死循环（recursive dependency detected）的冲突组件
rm -rf feeds/small/luci-app-fchomo
rm -rf feeds/small/dae
rm -rf feeds/small/daed

# 3. 如果有需要，可以取消下方注释来修改路由器的默认配置
# 修改默认后台 IP 为 192.168.11.1 (示例)
# sed -i 's/192.168.1.1/192.168.11.1/g' package/base-files/files/bin/config_generate
