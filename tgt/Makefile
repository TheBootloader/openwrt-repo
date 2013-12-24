#
# Copyright (C) 2012-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=tgt
PKG_VERSION:=1.0.42.4
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/fujita/tgt.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=fb4fff2a7b9d8c1fc2c1456c95cb38ea7ac2022f
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

include $(INCLUDE_DIR)/package.mk

define Package/tgt
  SECTION:=net
  CATEGORY:=Network
  URL:=http://stgt.sourceforge.net/
  TITLE:=userspace iSCSI target
  DEPENDS:=+libpthread
endef

define Package/tgt/description
Linux SCSI target framework (tgt) aims to simplify various SCSI target driver (iSCSI, Fibre Channel, SRP, etc) creation and maintenance.
Key goals of the project are the clean integration into the scsi-mid layer and implementing a great portion of tgt in user space.
Tgt consists of kernel-space and user-space code. The kernel-space component is included in upstream as of 2.6.20.
Note that if you are interested in only iSCSI (probably you are), you need only the user-space code (any kernel version is fine).
endef

define Build/Compile
		CC=$(TARGET_CC) $(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		LD="$(TARGET_CC)" \
		install-programs
endef

define Package/tgt/conffiles
	/etc/config/tgt
endef

define Package/tgt/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) ./files/etc/config/* $(1)/etc/config/
	$(INSTALL_BIN) ./files/etc/init.d/* $(1)/etc/init.d/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/tgtd $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/tgtadm $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,tgt))
