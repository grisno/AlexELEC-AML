################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libhybris"
PKG_VERSION="54dd474"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libhybris/libhybris/"
PKG_URL="none"
PKG_DEPENDS_TARGET="toolchain android-headers"
PKG_SECTION="devel"
PKG_SHORTDESC="libhybris: Allows to run bionic-based HW adaptations in glibc systems - libs"
PKG_LONGDESC="libhybris: Allows to run bionic-based HW adaptations in glibc systems - libs."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

unpack() {
  mkdir -p $PKG_BUILD
  git clone -b 'master' https://github.com/libhybris/libhybris.git $PKG_BUILD/src-temp
  cd $PKG_BUILD/src-temp
  git reset --hard $PKG_VERSION
  cd ..
  cp -PR src-temp/hybris/* ./
  rm -rf src-temp
  cd $ROOT
}

PKG_CONFIGURE_OPTS_TARGET="--enable-arch=$TARGET_ARCH \
                           --with-default-egl-platform=fbdev \
                           --with-android-headers=$ROOT/$BUILD/android-headers-25 \
                           --with-default-hybris-ld-library-path=/system/lib \
                           --enable-mali-quirks"
