DESCRIPTION = "Kria initramfs"

LICENSE = "MIT"

INITRAMFS_SCRIPTS ?= " \
    initramfs-framework-base \
    initramfs-module-exec \
    initramfs-module-e2fs \
    initramfs-module-rootfs \
    initramfs-module-udev \
    initramfs-module-loadkernelmodule \
    "

PACKAGE_INSTALL ?= " \
    ${INITRAMFS_SCRIPTS} \
    base-passwd \
    ${ROOTFS_BOOTSTRAP_INSTALL} \
    busybox \
    busybox-syslog \
    e2fsprogs \
    mac-config \
    "

INITRAMFS_MAXSIZE = "170000"

# Do not pollute the initrd image with rootfs features
IMAGE_FEATURES = ""
IMAGE_LINGUAS = ""
IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"

inherit core-image

IMAGE_ROOTFS_SIZE = "8192"
IMAGE_ROOTFS_EXTRA_SPACE = "0"

IMAGE_NAME_SUFFIX ?= ""
