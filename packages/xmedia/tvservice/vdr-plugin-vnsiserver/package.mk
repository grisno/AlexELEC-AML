################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-vnsiserver"
PKG_VERSION="0c84792"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/FernetMenta/vdr-plugin-vnsiserver"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="VDR plugin to handle KODI clients"
PKG_LONGDESC="The vdr-plugin-vnsiserver is able to handle serveral KODI clients connecting via the VNSI addon."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  : none
}

makeinstall_target() {
  make DESTDIR=$INSTALL install
}

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config/vdr/plugins/vnsiserver
    cp $PKG_DIR/config/allowed_hosts.conf $INSTALL/usr/config/vdr/plugins/vnsiserver
}
