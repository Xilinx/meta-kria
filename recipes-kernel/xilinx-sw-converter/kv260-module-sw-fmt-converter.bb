SUMMARY = "Recipe to build an pixel format converter Linux kernel module"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2183713b29ca76bf62eb5f62052a7aac"

inherit module

BRANCH = "release-2020.2.2_k26"
SRC_URI = "git://github.com/Xilinx/xilinx-sw-converter-module.git;protocol=https;branch=${BRANCH}"
SRCREV = "9546d613c756f0c98d4dd796f22d2ce5adfe3e2f"

S = "${WORKDIR}/git"
