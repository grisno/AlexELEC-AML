################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="opengl-meson-t82x"
PKG_VERSION="076f89d"
PKG_REV="1"
PKG_ARCH="arm aarch64"
PKG_LICENSE="nonfree"
PKG_SITE="https://github.com/kszaq/opengl-meson-t82x"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libhybris"
PKG_SOURCE_DIR="$PKG_NAME-$PKG_VERSION*"
PKG_SECTION="graphics"
PKG_SHORTDESC="opengl-meson: OpenGL ES pre-compiled libraries for Mali GPUs found in Amlogic Meson SoCs"
PKG_LONGDESC="opengl-meson: OpenGL ES pre-compiled libraries for Mali GPUs found in Amlogic Meson SoCs. The libraries could be found in a Linux buildroot released by Amlogic at http://openlinux.amlogic.com:8000/download/ARM/filesystem/. See the opengl package."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
 : # nothing todo
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/include
    cp -PR usr/include/* $SYSROOT_PREFIX/usr/include

  mkdir -p $INSTALL/system
    cp -PR system/* $INSTALL/system
}

post_install() {
  enable_service unbind-console.service
}
