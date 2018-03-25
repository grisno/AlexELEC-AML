################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.ru
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.ru)
################################################################################

PKG_NAME="protobuf"
PKG_VERSION="3.1.0"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="https://developers.google.com/protocol-buffers/"
PKG_URL="https://github.com/google/$PKG_NAME/releases/download/v$PKG_VERSION/$PKG_NAME-cpp-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="toolchain zlib:host"
PKG_DEPENDS_TARGET="toolchain zlib protobuf:host"
PKG_SECTION="xmedia/addons"
PKG_SHORTDESC="protobuf: Protocol Buffers - Google's data interchange format"
PKG_LONGDESC="protobuf: Protocol Buffers - Google's data interchange format"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CMAKE_SCRIPT="$ROOT/$PKG_BUILD/cmake/CMakeLists.txt"

PKG_CMAKE_OPTS_HOST="-DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 \
                     -DBUILD_SHARED_LIBS=0 \
                     -Dprotobuf_BUILD_TESTS=0 \
                     -Dprotobuf_BUILD_EXAMPLES=0 \
                     -Dprotobuf_WITH_ZLIB=1"

PKG_CMAKE_OPTS_TARGET="$PKG_CMAKE_OPTS_HOST"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin

  # HACK: we have protoc in $TOOLCHAIN/bin but it seems
  # the one from sysroot prefix is picked when building hyperion. remove it!
  rm -f $SYSROOT_PREFIX/usr/bin/protoc
}
