include $(TOPDIR)/rules.mk

PKG_NAME:=easyunblock
PKG_VERSION:=$(strip $(shell cat $(CURDIR)/../VERSION 2>/dev/null || echo 1.0.0))
PKG_RELEASE:=1
PKG_MAINTAINER:=easyunblock
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/easyunblock
  SECTION:=net
  CATEGORY:=Network
  TITLE:=easyunblock — split-tunnel VPN-шлюз для OpenWrt (движок без UI)
  URL:=https://github.com/xyzmean/easyunblock
  DEPENDS:=+nftables +curl +dnsmasq-full +ip-full +kmod-nft-core
  PKGARCH:=all
endef

define Package/easyunblock/description
 easyunblock маршрутизирует трафик локальной сети через WireGuard/AmneziaWG-туннель:
 заблокированное идёт через VPN, остальное — напрямую. Приоритетный failover между
 туннелями, автообновляемые списки, опциональный обход DPI (zapret). Только движок
 (CLI + doctor), без LuCI и без удалённого управления. zapret определяется в рантайме.
endef

define Package/easyunblock/conffiles
/etc/config/splify
endef

Build/Compile:=

define Package/easyunblock/install
	$(INSTALL_DIR) $(1)
	$(CP) ./files/* $(1)/
	chmod 0755 $(1)/usr/local/sbin/easyunblock-* $(1)/etc/init.d/easyunblock
endef

define Package/easyunblock/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] && exit 0
# daily list refresh (idempotent)
CRON=/etc/crontabs/root; touch "$$CRON"
grep -q 'easyunblock-update-ipsum'   "$$CRON" || echo '30 4 * * * /usr/local/sbin/easyunblock-update-ipsum >/dev/null 2>&1'   >> "$$CRON"
grep -q 'easyunblock-update-ru'      "$$CRON" || echo '45 4 * * * /usr/local/sbin/easyunblock-update-ru >/dev/null 2>&1'      >> "$$CRON"
grep -q 'easyunblock-update-domains' "$$CRON" || echo '50 4 * * * /usr/local/sbin/easyunblock-update-domains >/dev/null 2>&1' >> "$$CRON"
/etc/init.d/cron enable >/dev/null 2>&1; /etc/init.d/cron restart >/dev/null 2>&1
/etc/init.d/easyunblock enable >/dev/null 2>&1
/etc/init.d/easyunblock restart >/dev/null 2>&1
# first list fetch in the background so the install returns promptly
( /usr/local/sbin/easyunblock-update-ipsum; /usr/local/sbin/easyunblock-update-ru; /usr/local/sbin/easyunblock-update-domains ) >/dev/null 2>&1 &
exit 0
endef

define Package/easyunblock/prerm
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] && exit 0
/usr/local/sbin/easyunblock-uninstall >/dev/null 2>&1 || true
exit 0
endef

$(eval $(call BuildPackage,easyunblock))
