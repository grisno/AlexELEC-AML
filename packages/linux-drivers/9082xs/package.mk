################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="9082xs"
PKG_VERSION="1.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.alexelec.in.ua"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="scan-m3u: scan IPTV channels for VDR"
PKG_LONGDESC="scan-m3u: scan IPTV channels for VDR."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # none
}

makeinstall_target() {
  # kernel module
  mkdir -p $INSTALL/lib/modules/$(get_module_dir)/$PKG_NAME
    cp 9082xs.ko $INSTALL/lib/modules/$(get_module_dir)/$PKG_NAME/
}
