SUMMARY = "Recipe to build an pixel format converter Linux kernel module"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2183713b29ca76bf62eb5f62052a7aac"

inherit module

BRANCH = "xlnx_rel_v2021.2"
SRC_URI = "git://github.com/Xilinx/xilinx-sw-converter-module.git;protocol=https;branch=${BRANCH}"
SRCREV = "845c55801464a8bdcdd93618b54c11136a2d5ce4"

S = "${WORKDIR}/git"
