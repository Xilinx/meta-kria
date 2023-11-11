DESCRIPTION = "Kria initramfs"

LICENSE = "MIT"

INITRAMFS_SCRIPTS ?= " \
    initramfs-framework-base \
    initramfs-module-exec \
    initramfs-module-e2fs \
    initramfs-module-rootfs \
    initramfs-module-udev \
    "

PACKAGE_INSTALL ?= " \
    ${INITRAMFS_SCRIPTS} \
    ${VIRTUAL-RUNTIME_base-utils} \
    base-passwd \
    ${ROOTFS_BOOTSTRAP_INSTALL} \
    e2fsprogs \
    misc-config \
    "

# Do not pollute the initrd image with rootfs features
IMAGE_FEATURES = ""
IMAGE_LINGUAS = ""
IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"

inherit core-image

IMAGE_ROOTFS_SIZE = "8192"
IMAGE_ROOTFS_EXTRA_SPACE = "0"
