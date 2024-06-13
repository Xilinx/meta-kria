SUMMARY = "Package for building a installable toolchain for Kria"
LICENSE = "MIT"

PR = "r0"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:kria = "${MACHINE}"

inherit populate_sdk

TOOLCHAIN_TARGET_TASK:append = " \
    packagegroup-xilinx-audio-dev \
    packagegroup-xilinx-gstreamer-dev \
    packagegroup-opencv-dev \
    packagegroup-kria-dev \
    packagegroup-tsn-dev \
"

#packagegroup-vitisai-dev
#packagegroup-petalinux-vvas-dev
