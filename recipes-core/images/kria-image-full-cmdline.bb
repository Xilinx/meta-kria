DESCRIPTION = "A full featured console-only image for Kria SOM."

inherit core-image
IMAGE_CLASSES += "kria-image"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:kria = "${MACHINE}"

IMAGE_FEATURES += "splash ssh-server-openssh hwcodecs package-management"

IMAGE_INSTALL = " \
    packagegroup-core-boot \
    packagegroup-petalinux-kria \
    kernel-modules \
    ${@'libdfx' if 'xilinx-tools' in d.getVar('BBFILE_COLLECTIONS').split() else ''} \
    hellopm \
    haveged \
    htop \
    meson \
    nfs-utils \
    nfs-utils-client \
    u-boot-tools \
    linux-xlnx-udev-rules \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    e2fsprogs-mke2fs \
    fpga-manager-script \
    udev-extraconf \
    watchdog-init \
    wireless-regdb-static \
"
