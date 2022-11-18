SUMMARY = "Package for building a installable toolchain for Kria"
LICENSE = "MIT"

PR = "r0"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:kria = "${MACHINE}"

inherit populate_sdk

TOOLCHAIN_TARGET_TASK:append = " \
    packagegroup-petalinux-audio-dev \
    packagegroup-petalinux-gstreamer-dev \
    packagegroup-petalinux-opencv-dev \
    packagegroup-petalinux-kria-dev \
    packagegroup-petalinux-tsn-dev \
"

#packagegroup-petalinux-vitisai-dev
#packagegroup-petalinux-vvas-dev
