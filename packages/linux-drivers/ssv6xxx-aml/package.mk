################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="ssv6xxx-aml"
PKG_VERSION="1041e7d"
PKG_REV="1"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_URL="$ALEXELEC_SRC/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="ssv6xxx-${PKG_VERSION}*"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver"
PKG_SHORTDESC="ssv6xxx-aml"
PKG_LONGDESC="ssv6xxx-aml"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

if [ "$TARGET_KERNEL_ARCH" = "arm64" -a "$TARGET_ARCH" = "arm" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET gcc-linaro-aarch64-linux-gnu:host"
  export PATH=$ROOT/$TOOLCHAIN/lib/gcc-linaro-aarch64-linux-gnu/bin/:$PATH
  TARGET_PREFIX=aarch64-linux-gnu-
fi

pre_configure_target() {
  sed -i 's,hw_cap_p2p = on,hw_cap_p2p = off,g' ssv6051/firmware/ssv6051-wifi.cfg
}

make_target() {
  if [ "$TARGET_KERNEL_ARCH" = "arm64" ]; then
    PLATFORM="aml-s905"
  else
    PLATFORM="aml-s805"
  fi

  cd ssv6051
    ./ver_info.pl include/ssv_version.h
    cp Makefile.android Makefile
    sed -i 's,PLATFORMS =,PLATFORMS = '"$PLATFORM"',g' Makefile
    LDFLAGS="" SSV_ARCH="$TARGET_KERNEL_ARCH" SSV_CROSS="$TARGET_PREFIX" SSV_KERNEL_PATH="$(kernel_path)" make module
}

makeinstall_target() {
  # kernel module
  mkdir -p $INSTALL/lib/modules/$(get_module_dir)/$PKG_NAME
    cp ssv6051.ko $INSTALL/lib/modules/$(get_module_dir)/$PKG_NAME/

  # firmware
  mkdir -p $INSTALL/lib/firmware/ssv6051
    cp firmware/* $INSTALL/lib/firmware/ssv6051/
}
