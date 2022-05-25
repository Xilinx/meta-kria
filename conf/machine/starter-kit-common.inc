require conf/machine/k26-som.conf

INITRAMFS_IMAGE = "petalinux-initramfs-image"

IMAGE_FSTYPES:zynqmp = "cpio cpio.gz cpio.gz.u-boot ext4 tar.gz jffs2 wic wic.xz"
INITRAMFS_FSTYPES = "cpio.gz cpio.gz.u-boot tar.gz"
IMAGE_FSTYPES:pn-${INITRAMFS_IMAGE}:zynqmp = "${INITRAMFS_FSTYPES}"

MAGE_BOOT_FILES = "Image ${INITRAMFS_IMAGE}-${MACHINE}.cpio.gz.u-boot boot.scr system.dtb"

WKS_FILES = "${MACHINE}-sd.wks"
