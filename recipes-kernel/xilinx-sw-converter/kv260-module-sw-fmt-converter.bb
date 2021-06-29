SUMMARY = "Recipe to build an pixel format converter Linux kernel module"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2183713b29ca76bf62eb5f62052a7aac"

inherit module

BRANCH = "master"
SRC_URI = "git://github.com/Xilinx/xilinx-sw-converter-module.git;protocol=https;branch=${BRANCH}"
SRCREV = "e29476d35d94747ab49f6d875acab546a2ffbee5"

S = "${WORKDIR}/git"
