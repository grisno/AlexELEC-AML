################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="android-headers"
PKG_VERSION="25"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Apache"
PKG_SITE="https://android.googlesource.com/"
PKG_URL="https://kszaq.libreelec.tv/sources/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="devel"
PKG_SHORTDESC="android-headers: Android Platform Headers from AOSP releases"
PKG_LONGDESC="android-headers: Android Platform Headers from AOSP releases."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nop
}

makeinstall_target() {
  : # nop
}
