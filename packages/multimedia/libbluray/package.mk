################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libbluray"
PKG_VERSION="0.9.3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://www.videolan.org/developers/libbluray.html"
PKG_URL="https://ftp.videolan.org/pub/videolan/libbluray/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain fontconfig freetype libxml2"
PKG_SECTION="multimedia"
PKG_SHORTDESC="libbluray: A Blu-Ray Discs playback library"
PKG_LONGDESC="libbluray is an open-source library designed for Blu-Ray Discs playback for media players, like VLC or MPlayer."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

if [ "$BLURAY_AACS_SUPPORT" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libaacs"
fi

if [ "$BLURAY_BDPLUS_SUPPORT" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libbdplus"
fi

PKG_CONFIGURE_OPTS_TARGET="--disable-werror \
                           --disable-extra-warnings \
                           --disable-optimizations \
                           --disable-examples \
                           --disable-bdjava \
                           --enable-udf \
                           --disable-doxygen-doc \
                           --disable-doxygen-dot \
                           --disable-doxygen-man \
                           --disable-doxygen-rtf \
                           --disable-doxygen-xml \
                           --disable-doxygen-chm \
                           --disable-doxygen-chi \
                           --disable-doxygen-html \
                           --disable-doxygen-ps \
                           --disable-doxygen-pdf \
                           --with-freetype \
                           --with-fontconfig \
                           --with-libxml2 \
                           --with-gnu-ld"
