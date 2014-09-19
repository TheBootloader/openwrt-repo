#
# Copyright (C) 2008-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=motion
PKG_VERSION:=20140827-051001
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.lavrsen.dk/sources/motion-daily \
		@SF/motion
PKG_MD5SUM:=26128e8178eb75c0e7049db78e373510

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/motion
	SECTION:=multimedia
	CATEGORY:=Multimedia
	DEPENDS:=+libjpeg +libpthread
	TITLE:=webcam motion sensing and logging
	URL:=http://www.lavrsen.dk/twiki/bin/view/Motion/WebHome
endef

define Package/motion/conffiles
	/etc/motion.conf
endef

CONFIGURE_ARGS+= \
	--without-optimizecpu \
	--without-ffmpeg \
	--without-jpeg-mmx \
	--without-sdl \
	--without-mysql \
	--without-pgsql \
	--without-sqlite3 \

define Package/motion/install
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/etc/motion-dist.conf $(1)/etc/motion.conf
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/motion $(1)/usr/bin/

endef

$(eval $(call BuildPackage,motion))
