################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-svdrpservice"
PKG_VERSION="1.0.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://vdr.schmirler.de/"
PKG_URL="$PKG_SITE/svdrpservice/vdr-svdrpservice-$PKG_VERSION.tgz"
PKG_SOURCE_DIR="svdrpservice-*"
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="Offers SVDRP connections as a service to other plugins"
PKG_LONGDESC="Offers SVDRP connections as a service to other plugins."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  : # none
}

makeinstall_target() {
  make DESTDIR=$INSTALL install
}
