#
# This file is the recipe for AXI qos utility.
#

SUMMARY = "Application for setting the qos values for DDR slots"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c5ded2ac97b4ce01aa0ace8f3a1755"

BRANCH = "master"
SRC_URI = "git://github.com/Xilinx/axi-qos.git;protocol=https;branch=${BRANCH}"
SRCREV = "1efd01554f9f1d79e69ceab5db242a6f5813e9cc"

inherit cmake

EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Release -DCMAKE_SYSROOT=${STAGING_DIR_HOST}"

S = "${WORKDIR}/git"

do_install:append() {
    chmod u+rxs ${D}${bindir}/axi-qos
}

FILES:${PN} += " \
	/usr/bin \
	"
