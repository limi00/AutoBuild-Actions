#!/bin/bash
# https://github.com/Hyy2001X/AutoBuild-Actions
# AutoBuild Module by Hyy2001
# AutoBuild DiyScript

Diy_Core() {
	Author=Hyy2001
	Default_Device=xiaomi_mir3g

	INCLUDE_AutoUpdate=true
	INCLUDE_AutoBuild_Tools=true
	INCLUDE_Keep_Latest_Xray=true
	INCLUDE_mt7621_OC1000MHz=false
	INCLUDE_Enable_FirewallPort_53=true

	INCLUDE_SSR_Plus=false
	INCLUDE_Passwall=false
	INCLUDE_HelloWorld=false
	INCLUDE_Bypass=false
	INCLUDE_OpenClash=false
}

Diy-Part1() {
	Diy_Part1_Base

	if [ "${Default_Device}" == "xiaomi_mir3g" ];then
		Replace_File Customize/system_xiaomi_mir3g package/base-files/files/etc/config system
	else
		Replace_File Customize/system_common package/base-files/files/etc/config system
	fi

	Update_Makefile exfat package/kernel/exfat

	Replace_File Customize/mt76-20210127.mk package/kernel/mt76 Makefile
	rm -rf package/kernel/mt76/patches

	# ExtraPackages svn network/services dnsmasq https://github.com/openwrt/openwrt/trunk/package/network/services
	# ExtraPackages svn network/services dropbear https://github.com/openwrt/openwrt/trunk/package/network/services
	# ExtraPackages svn network/services ppp https://github.com/openwrt/openwrt/trunk/package/network/services
	# ExtraPackages svn network/services hostapd https://github.com/openwrt/openwrt/trunk/package/network/services
	# ExtraPackages svn kernel mt76 https://github.com/openwrt/openwrt/trunk/package/kernel

	ExtraPackages git lean luci-theme-argon https://github.com/jerrykuku 18.06
	# ExtraPackages git other luci-app-argon-config https://github.com/jerrykuku master
	ExtraPackages git other luci-app-adguardhome https://github.com/Hyy2001X master
	# ExtraPackages svn other luci-app-smartdns https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t
	ExtraPackages git other luci-app-serverchan https://github.com/tty228 master
	# ExtraPackages svn other luci-app-socat https://github.com/Lienol/openwrt-package/trunk
	ExtraPackages svn other luci-app-usb3disable https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw
}

Diy-Part2() {
	Diy_Part2_Base
}

Diy-Part3() {
	Diy_Part3_Base
}
