################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.ru
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.ru)
################################################################################

PKG_NAME="rpi_ws281x"
PKG_VERSION="f580777"
PKG_ARCH="any"
PKG_LICENSE="BSD-3c"
PKG_SITE="https://github.com/hyperion-project/rpi_ws281x"
PKG_URL="https://github.com/hyperion-project/rpi_ws281x/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/addons"
PKG_SHORTDESC="Userspace Raspberry Pi PWM library for WS281X LEDs"
PKG_LONGDESC="Userspace Raspberry Pi PWM library for WS281X LEDs"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  :
}

makeinstall_target() {
  :
}
