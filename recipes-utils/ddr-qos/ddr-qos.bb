#
# This file is the DDR slot qos setting application recipe.
#

SUMMARY = "Application for setting the qos values for DDR slots"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c5ded2ac97b4ce01aa0ace8f3a1755"

BRANCH = "master"
SRC_URI = "git://github.com/Xilinx/ddr-qos.git;protocol=https;branch=${BRANCH}"
SRCREV = "800c9fe7fac252cdb330d2c834a2ec51298cc2d3"

inherit cmake

SOMAPP_INSTALL_PATH = "/"
EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Release -DCMAKE_SYSROOT=${STAGING_DIR_HOST} -DCMAKE_INSTALL_PREFIX=${SOMAPP_INSTALL_PATH}"

S = "${WORKDIR}/git"

FILES_${PN} += " \
	/usr/bin \
	"
