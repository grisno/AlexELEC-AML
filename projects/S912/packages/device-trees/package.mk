################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="device-trees"
PKG_VERSION="0.1"
PKG_REV="1"
PKG_LICENSE="OSS"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_AUTORECONF="no"

EXTRA_TREES=(gxm_q200_1g.dtb gxm_q200_2g.dtb gxm_q200_2g_minix.dtb gxm_q200_3g.dtb gxm_q200_k3.dtb gxm_q201_1g.dtb gxm_q201_2g.dtb gxm_q201_3g.dtb)

if [ "$TARGET_KERNEL_ARCH" = "arm64" -a "$TARGET_ARCH" = "arm" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET gcc-linaro-aarch64-linux-gnu:host"
  export PATH=$ROOT/$TOOLCHAIN/lib/gcc-linaro-aarch64-linux-gnu/bin/:$PATH
  TARGET_PREFIX=aarch64-linux-gnu-
fi

make_target() {
  pushd $ROOT/$BUILD/linux-$(kernel_version) > /dev/null

  mkdir -p $TARGET_IMG

  # Kernel-tree trees
  for f in ${EXTRA_TREES[@]}; do
    LDFLAGS="" make $f
    mv arch/$TARGET_KERNEL_ARCH/boot/dts/amlogic/$f $TARGET_IMG
  done

  popd > /dev/null
}

makeinstall_target() {
  : # none
}
