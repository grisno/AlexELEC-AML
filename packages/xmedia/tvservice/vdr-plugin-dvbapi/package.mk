################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-dvbapi"
PKG_VERSION="7d51cc4"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/manio/vdr-plugin-dvbapi"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain vdr libdvbcsa"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="TV"
PKG_LONGDESC="TV"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

pre_make_target() {
  # dont build parallel
  MAKEFLAGS=-j1
}

make_target() {
  : not
}

makeinstall_target() {
  make LIBDVBCSA=1 \
       GITTAG=$PKG_VERSION \
       DESTDIR=$INSTALL \
       install
}
