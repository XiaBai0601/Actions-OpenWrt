#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 主题
git clone https://github.com/DHDAXCW/theme
svn export https://github.com/jerrykuku/luci-theme-argon/branches/18.06 luci-theme-argon
svn export https://github.com/kenzok8/openwrt-packages/trunk/luci-app-argon-config
rm -rf ../../customfeeds/luci/themes/luci-theme-argon
#rm -rf ./luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
cp -f $GITHUB_WORKSPACE/images/bg1.jpg luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg # 修改默认背景

# 修复移远PCIe驱动(quectel_MHI)
rm -rf package/wwan/driver/quectel_MHI
svn export https://github.com/Siriling/5G-Modem-Support/trunk/quectel_MHI package/wwan/driver/quectel_MHI

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
