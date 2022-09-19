SUMMARY = "Xilinx xlnx_platformstats library"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=616cf8b6d1f4be98265ef661616934d0"

BRANCH ?= "xlnx_rel_v2022.2"
SRC_URI = "git://github.com/Xilinx/xlnx_platformstats.git;protocol=https;branch=${BRANCH}"
SRCREV ?= "75ca94a7a6e44658e30c353030e3be0d53552c30"

PARALLEL_MAKE = "-j 1"

S="${WORKDIR}/git"

PROVIDES = "platformstats"

DEPENDS += "swig-native"

inherit python3targetconfig autotools-brokensep

export PYTHON_BASEVERSION
export PYTHON_SITEPACKAGES_DIR

PACKAGES =+ "${PN}-python"

FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"

RREPLACES:${PN} = "platformstats"
RREPLACES:${PN}-python = "platformstats-python"
RREPLACES:${PN}-src = "platformstats-src"
RREPLACES:${PN}-dbg = "platformstats-dbg"
RREPLACES:${PN}-staticdev = "platformstats-staticdev"
RREPLACES:${PN}-dev = "platformstats-dev"
RREPLACES:${PN}-doc = "platformstats-doc"
RREPLACES:${PN}-locale = "platformstats-locale"
