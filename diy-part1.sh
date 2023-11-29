#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git hypermodem https://github.com/momokind/luci-app-hypermodem.git;main' >>feeds.conf.default

## 5g模块(rm500q-gl和rm500u-cn)
sed -i 's/# CONFIG_PACKAGE_quectel-CM-5G is not set/CONFIG_PACKAGE_quectel-CM-5G=y/g' .config
sed -i 's/# CONFIG_PACKAGE_usb-modeswitch is not set/CONFIG_PACKAGE_usb-modeswitch=y/g' .config
sed -i 's/# CONFIG_PACKAGE_kmod-mii is not set/CONFIG_PACKAGE_kmod-mii=y/g' .config
sed -i 's/# CONFIG_PACKAGE_kmod-usb-net is not set/CONFIG_PACKAGE_kmod-usb-net=y/g' .config
sed -i 's/# CONFIG_PACKAGE_kmod-usb-wdm is not set/CONFIG_PACKAGE_kmod-usb-wdm=y/g' .config
sed -i 's/# CONFIG_PACKAGE_kmod-usb-net-qmi-wwan is not set/CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y/g' .config
sed -i 's/# CONFIG_PACKAGE_uqmi is not set/CONFIG_PACKAGE_uqmi=y/g' .config
sed -i 's/# CONFIG_PACKAGE_kmod-usb-net-cdc-mbim is not set/CONFIG_PACKAGE_kmod-usb-net-cdc-mbim=y/g' .config
sed -i 's/# CONFIG_PACKAGE_umbim is not set/CONFIG_PACKAGE_umbim=y/g' .config
sed -i 's/# CONFIG_PACKAGE_kmod-usb-serial-option is not set/CONFIG_PACKAGE_kmod-usb-serial-option=y/g' .config
sed -i 's/# CONFIG_PACKAGE_kmod-usb-serial is not set/CONFIG_PACKAGE_kmod-usb-serial=y/g' .config
sed -i 's/# CONFIG_PACKAGE_kmod-usb-serial-wwan is not set/CONFIG_PACKAGE_kmod-usb-serial-wwan=y/g' .config
sed -i 's/# CONFIG_PACKAGE_luci-proto-qmi is not set/CONFIG_PACKAGE_luci-proto-qmi=y/g' .config
sed -i 's/# CONFIG_PACKAGE_kmod-usb-net-rndis is not set/CONFIG_PACKAGE_kmod-usb-net-rndis=y/g' .config
sed -i '/CONFIG_PACKAGE_kmod-usb-serial=y/a\CONFIG_PACKAGE_kmod-usb-serial-wwan=y' .config
