################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="streamlink"
PKG_VERSION="ce6de2c"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="https://github.com/streamlink/streamlink"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python distutilscross:host setuptools PySocks requests pycrypto websocket-client iso639 python-iso3166 backports.shutil_which backports.shutil_get_terminal_size singledispatch pythonfutures backports.ssl_match_hostname python-certifi chardet urllib3 idna"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="Streamlink is a CLI utility that pipes flash videos from online streaming services to a variety of video players such as VLC, or alternatively, a browser"
PKG_LONGDESC="Streamlink is a CLI utility that pipes flash videos from online streaming services to a variety of video players such as VLC, or alternatively, a browser."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDSHARED="$CC -shared"
  export STREAMLINK_USE_PYCRYPTO="true"
}

make_target() {
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
  $SED 's|^#!/src/.*python|#!/usr/bin/python|' -i $INSTALL/usr/bin/streamlink

  mkdir -p $INSTALL/usr/config/streamlink
    cp -P $PKG_DIR/scripts/* $INSTALL/usr/config/streamlink
  mkdir -p $INSTALL/usr/bin
    ln -sf /storage/.config/streamlink/streamplay $INSTALL/usr/bin/streamplay
}
