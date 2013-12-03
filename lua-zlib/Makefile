# 
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Package origin: https://github.com/TheBootloader/openwrt-repo/
#
include $(TOPDIR)/rules.mk

PKG_NAME:=lua-zlib
PKG_VERSION:=2013-11-21
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/brimworks/lua-zlib.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=962273981badee28339fa5a25b86effb107de1ad
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR)-$(PKG_SOURCE_VERSION).tar.gz
CMAKE_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/lua-zlib
	SUBMENU:=Lua
	SECTION:=lang
	CATEGORY:=Languages
	TITLE:=Brimworks zlib library for Lua
	DEPENDS:=+zlib
endef

define Package/lua-zlib/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/
	$(CP) $(PKG_BUILD_DIR)/zlib.so $(1)/usr/lib/lua/
endef

$(eval $(call BuildPackage,lua-zlib))
