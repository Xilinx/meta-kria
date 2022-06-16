SUMMARY = "Xilinx platformstats library"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=616cf8b6d1f4be98265ef661616934d0"

BRANCH ?= "master"
SRC_URI = "git://github.com/Xilinx/platformstats.git;protocol=https;branch=${BRANCH}"
SRCREV ?= "616ce539edb190431f332b42fbd4fe714f41a8aa"

PARALLEL_MAKE = "-j 1"

S="${WORKDIR}/git"

DEPENDS += "swig-native"

inherit python3targetconfig autotools-brokensep

export PYTHON_BASEVERSION
export PYTHON_SITEPACKAGES_DIR

PACKAGES =+ "${PN}-python"

FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
