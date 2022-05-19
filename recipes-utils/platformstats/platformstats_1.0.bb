SUMMARY = "Xilinx platformstats library"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=616cf8b6d1f4be98265ef661616934d0"

BRANCH ?= "xlnx_rel_v2022.1"
SRC_URI = "git://github.com/Xilinx/platformstats.git;protocol=https;branch=${BRANCH}"
SRCREV ?= "c8ed77c0c5d87b600422e3248d323ca0e842dd80"

PARALLEL_MAKE = "-j 1"

S="${WORKDIR}/git"

DEPENDS += "swig-native"

inherit python3targetconfig autotools-brokensep

export PYTHON_BASEVERSION
export PYTHON_SITEPACKAGES_DIR

PACKAGES =+ "${PN}-python"

FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
