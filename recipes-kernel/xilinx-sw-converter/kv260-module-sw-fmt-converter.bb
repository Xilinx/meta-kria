SUMMARY = "Recipe to build an pixel format converter Linux kernel module"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=bcbc7731ccb719dfd2fbd9dd9bad82fe"

inherit module

BRANCH = "master"
SRC_URI = "git://github.xilinx.com/SOM/xilinx-sw-converter-module.git;protocol=https;branch=${BRANCH}"
SRCREV = "b7a3380ebf946b1c8ec736b48d3a6f7de78bbfe7"

S = "${WORKDIR}/git"
