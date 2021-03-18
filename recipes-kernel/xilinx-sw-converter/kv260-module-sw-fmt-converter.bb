SUMMARY = "Recipe to build an pixel format converter Linux kernel module"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=579c880f06a3d94e439c064a39b70614"

inherit module

BRANCH = "master"
SRC_URI = "git://github.xilinx.com/SOM/xilinx-sw-converter-module.git;protocol=https;branch=${BRANCH}"
SRCREV = "310a055ca9d5df021af1f90493af78a92e099dd3"

S = "${WORKDIR}/git"
