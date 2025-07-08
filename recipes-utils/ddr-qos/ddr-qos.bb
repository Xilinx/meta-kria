#
# This file is the DDR slot qos setting application recipe.
#

SUMMARY = "Application for setting the qos values for DDR slots"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c5ded2ac97b4ce01aa0ace8f3a1755"

PV .= "+git"

BRANCH = "master"
SRC_URI = "git://github.com/Xilinx/ddr-qos.git;protocol=https;branch=${BRANCH}"
SRCREV = "67ac7457755de9aef93c1398446edb1461ae2947"

inherit cmake

EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Release -DCMAKE_SYSROOT=${STAGING_DIR_HOST}"

S = "${WORKDIR}/git"

do_install:append() {
    chmod u+rxs ${D}${bindir}/ddr-qos
}

FILES:${PN} += " \
	/usr/bin \
	"
