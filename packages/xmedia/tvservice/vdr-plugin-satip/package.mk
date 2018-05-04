################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-satip"
PKG_VERSION="299296b"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/rofafor/vdr-plugin-satip"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain vdr curl tinyxml"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="VDR-satip: SAT>IP plugin for VDR"
PKG_LONGDESC="This is an SAT>IP plugin for the Video Disk Recorder (VDR)."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  : # none
}

makeinstall_target() {
  make SATIP_USE_TINYXML=1 \
       GITTAG=$PKG_VERSION \
       DESTDIR=$INSTALL \
       install
}
