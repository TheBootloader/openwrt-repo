#
# Copyright (C) 2009-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=prosody
PKG_VERSION:=0.8.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://prosody.im/downloads/source
PKG_MD5SUM:=6e907bf0d0acf24f1011083020ba6ffb

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=lua

include $(INCLUDE_DIR)/package.mk

define Package/prosody
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Instant Messaging
  DEPENDS:=+luafilesystem +libidn +luaexpat +luasec
  TITLE:=XMPP server
  URL:=http://prosody.im/
endef

define Package/prosody/description
  [PATCH: 0.6 -> 0.8.2] Prosody is an exciting new server for Jabber/XMPP
  written in Lua. It aims to be easy to use, and light
  on resources
endef

define Package/prosody/conffiles
/etc/prosody/prosody.cfg.lua
endef

TARGET_CFLAGS += $(FPIC)
CMAKE_OPTIONS = -DLUAPATH=/usr/lib/lua

define Build/Configure
	# this is *NOT* GNU autoconf stuff
	(cd $(PKG_BUILD_DIR); ./configure \
		--prefix=/usr \
		--with-lua="$(STAGING_DIR)/host/bin" \
		--with-lua-include="$(STAGING_DIR)/usr/include" \
		--with-lua-lib="$(STAGING_DIR)/usr/lib" \
		--cflags="$(TARGET_CFLAGS)" \
		--datadir="/etc/prosody/data" \
	)
endef

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) -std=gnu99" \
	LDFLAGS="$(TARGET_LDFLAGS)" \
	PREFIX="/usr" \

define Package/prosody/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/prosody.init $(1)/etc/init.d/prosody
	$(INSTALL_BIN) ./files/mod_smacks.lua $(1)/usr/lib/prosody/modules/
	$(INSTALL_DIR) $(1)/etc/prosody
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/prosody/prosody.cfg.lua $(1)/etc/prosody/
	$(INSTALL_DIR) $(1)/etc/prosody/certs
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/prosody/certs/localhost.{cert,key} $(1)/etc/prosody/certs/
	$(INSTALL_DIR) $(1)/etc/prosody/data
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/prosody{,ctl} $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/prosody
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/prosody/prosody.version $(1)/usr/lib/prosody/
	$(INSTALL_DIR) $(1)/usr/lib/prosody/core
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/prosody/core/*.lua $(1)/usr/lib/prosody/core/
	$(INSTALL_DIR) $(1)/usr/lib/prosody/fallbacks
#	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/prosody/fallbacks/*.lua $(1)/usr/lib/prosody/fallbacks/
	$(INSTALL_DIR) $(1)/usr/lib/prosody/modules
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/prosody/modules/*.lua $(1)/usr/lib/prosody/modules/
	$(INSTALL_DIR) $(1)/usr/lib/prosody/modules/muc
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/prosody/modules/muc/*.lua $(1)/usr/lib/prosody/modules/muc/
	$(INSTALL_DIR) $(1)/usr/lib/prosody/modules/adhoc
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/prosody/modules/adhoc/*.lua $(1)/usr/lib/prosody/modules/adhoc/
	$(INSTALL_DIR) $(1)/usr/lib/prosody/net
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/prosody/net/*.lua $(1)/usr/lib/prosody/net/
	$(INSTALL_DIR) $(1)/usr/lib/prosody/util
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/prosody/util/*.lua $(1)/usr/lib/prosody/util/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/prosody/util/*.so $(1)/usr/lib/prosody/util/
	$(INSTALL_DIR) $(1)/usr/lib/prosody/util/sasl
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/prosody/util/sasl/*.lua $(1)/usr/lib/prosody/util/sasl/
endef

$(eval $(call BuildPackage,prosody))
