DESCRIPTION = "A full featured console-only image for Kria SOM."

inherit core-image
IMAGE_CLASSES += "kria-image"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:kria = "${MACHINE}"

DEPENDS:remove:kria-zynqmp-generic = "virtual/bootloader virtual/fsbl"

IMAGE_FEATURES += "splash ssh-server-openssh hwcodecs package-management"

IMAGE_INSTALL = " \
    packagegroup-core-boot \
    packagegroup-kria \
    kernel-modules \
    nfs-utils \
    nfs-utils-client \
    u-boot-tools \
    linux-xlnx-udev-rules \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    udev-extraconf \
    wireless-regdb-static \
"
