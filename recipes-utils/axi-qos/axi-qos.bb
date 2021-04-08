#
# This file is the recipe for AXI qos utility.
#

SUMMARY = "Application for setting the qos values for DDR slots"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c5ded2ac97b4ce01aa0ace8f3a1755"

BRANCH = "master"
SRC_URI = "git://github.com/Xilinx/axi-qos.git;protocol=https;branch=${BRANCH}"
SRCREV = "e8a47881ef3e4aa56a5e740c0b2fae569370935e"

inherit cmake

SOMAPP_INSTALL_PATH = "/"
EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Release -DCMAKE_SYSROOT=${STAGING_DIR_HOST} -DCMAKE_INSTALL_PREFIX=${SOMAPP_INSTALL_PATH}"

S = "${WORKDIR}/git"

do_install_append() {
    chmod u+rxs ${D}${bindir}/axi-qos
}

FILES_${PN} += " \
	/usr/bin \
	"
