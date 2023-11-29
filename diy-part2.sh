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
# 修复移远PCIe驱动(quectel_MHI)
rm -rf package/wwan/driver/quectel_MHI
svn export https://github.com/Siriling/5G-Modem-Support/trunk/quectel_MHI package/wwan/driver/quectel_MHI

# 5G模组短信插件
rm -rf customfeeds/package/utils/sms-tool
rm -rf customfeeds/luci/applications/luci-app-sms-tool
svn export https://github.com/dwj0/luci-app-sms-tool/trunk/sms-tool package/community/sms-tool
svn export https://github.com/dwj0/luci-app-sms-tool/trunk/luci-app-sms-tool package/community/luci-app-sms-tool
svn export https://github.com/Siriling/OpenWRT-MyConfig/trunk/configs/general/applications/luci-app-sms-tool temp/luci-app-sms-tool
cp -rf temp/luci-app-sms-tool/* package/community/luci-app-sms-tool

# 5G模组拨号脚本
mkdir -p package/base-files/files/root/5GModem
cp -rf $GITHUB_WORKSPACE/tools/5G模组拨号脚本/5GModem/* package/base-files/files/root/5GModem
chmod -R a+x package/base-files/files/root/5GModem
svn export https://github.com/Siriling/OpenWRT-MyConfig/trunk/configs/general/etc/crontabs package/base-files/files/etc/crontabs
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
