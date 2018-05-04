################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-osd2web"
PKG_VERSION="b49478b"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/horchi/vdr-plugin-osd2web"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain vdr libwebsockets jansson tinyxml2"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="osd2web is a VDR skin interface for the browser, which displays the OSD and allows all interactions which are possible on the OSD"
PKG_LONGDESC="osd2web is a VDR skin interface for the browser, which displays the OSD and allows all interactions which are possible on the OSD."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  make CXX=$CXX GIT_REV=$PKG_VERSION
}

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config
    mv -f $INSTALL/storage/.config/vdr $INSTALL/usr/config
  rm -rf $INSTALL/storage
}
