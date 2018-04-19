################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-epgsearch"
PKG_VERSION="5887e0a"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://projects.vdr-developer.org/git/vdr-plugin-epgsearch.git"
PKG_URL="$PKG_SITE/snapshot/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="VDR -- epgsearch plugin"
PKG_LONGDESC="vdr-epgsearch is a plugin for VDR, the Video Disk Recorder."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  : not
}

makeinstall_target() {
  make DESTDIR=$INSTALL install
}

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config/vdr/plugins/epgsearch
    cp -PR $PKG_DIR/config/* $INSTALL/usr/config/vdr/plugins/epgsearch
  rm -rf $INSTALL/storage
}
