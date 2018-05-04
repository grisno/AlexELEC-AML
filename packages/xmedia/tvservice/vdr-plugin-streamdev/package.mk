################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-streamdev"
PKG_VERSION="e2a9b97"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://projects.vdr-developer.org/projects/plg-streamdev"
PKG_URL="https://projects.vdr-developer.org/git/$PKG_NAME.git/snapshot/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain vdr openssl"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="With the streamdev plugin you can receive live TV streams via network"
PKG_LONGDESC="With the streamdev plugin you can receive live TV streams via network."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  : none
}

makeinstall_target() {
  make LIBDIR=/usr/lib/vdr \
       DESTDIR=$INSTALL \
       install

  mkdir -p $INSTALL/usr/config/vdr/plugins/streamdev-server
    cp streamdev-server/* $INSTALL/usr/config/vdr/plugins/streamdev-server
    echo '0.0.0.0/0' >> $INSTALL/usr/config/vdr/plugins/streamdev-server/streamdevhosts.conf
}
