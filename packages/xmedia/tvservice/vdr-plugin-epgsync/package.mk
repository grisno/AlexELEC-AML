################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-epgsync"
PKG_VERSION="1.0.1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://vdr.schmirler.de/"
PKG_URL="$PKG_SITE/epgsync/vdr-epgsync-$PKG_VERSION.tgz"
PKG_SOURCE_DIR="epgsync-*"
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="Import the EPG of a remote VDR"
PKG_LONGDESC="Import the EPG of a remote VDR."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  : # none
}

makeinstall_target() {
  make DESTDIR=$INSTALL install
}
