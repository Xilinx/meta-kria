require conf/machine/k26-som.conf

UBOOT_DT_FILES ?= "\
    zynqmp-sck-kr-g-revA.dts \
    zynqmp-sck-kr-g-revB.dts \
    zynqmp-sck-kv-g-revA.dts \
    zynqmp-sck-kv-g-revB.dts \
    "

INITRAMFS_IMAGE = "petalinux-initramfs-image"

IMAGE_FSTYPES += " ext4 wic wic.xz wic.qemu-sd"

QB_DEFAULT_FSTYPE = "wic.qemu-sd"

INITRAMFS_FSTYPES = "cpio.gz cpio.gz.u-boot tar.gz"
IMAGE_FSTYPES:pn-${INITRAMFS_IMAGE}:zynqmp = "${INITRAMFS_FSTYPES}"
RAMDISK_IMAGE1 = "${INITRAMFS_IMAGE}-${MACHINE}.cpio.gz.u-boot"

EXTRA_IMAGEDEPENDS:remove = "u-boot-zynq-uenv"
IMAGE_BOOT_FILES = "Image ${INITRAMFS_IMAGE}-${MACHINE}.cpio.gz.u-boot boot.scr"

WKS_FILES = "k26-starter-kit-sd.wks"
