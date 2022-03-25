SUMMARY = "Xilinx platformstats library"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=616cf8b6d1f4be98265ef661616934d0"

BRANCH ?= "master"
SRC_URI = "git://github.com/Xilinx/platformstats.git;protocol=https;branch=${BRANCH}"
SRCREV ?="a6d397aa24175772840ff11d28da54dfca3fa1bf"

SRC_URI += "file://0001-fixup-ldflags.patch"

PARALLEL_MAKE = "-j 1"

S="${WORKDIR}/git"

DEPENDS += "swig-native"

inherit python3targetconfig

do_compile(){
	cd ${S}/src
	oe_runmake

	cd ${S}/app
	oe_runmake

	cd ${S}/python-bindings
	oe_runmake PYTHON_INCLUDE="-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} -l${PYTHON_DIR}"
}

do_install(){
	install -d ${D}${libdir}
	oe_soinstall ${S}/src/*.so.1.0 ${D}${libdir}

	install -d ${D}${includedir}/platformstats
	install -m 0644 ${S}/include/platformstats/*.h ${D}${includedir}/platformstats/.

	install -d ${D}${bindir}
	install -m 0755 ${S}/app/platformstats ${D}${bindir}/platformstats

	install -d ${D}${PYTHON_SITEPACKAGES_DIR}/${BPN}
	install -m 0644 ${S}/python-bindings/pbindings.py ${D}${PYTHON_SITEPACKAGES_DIR}/${BPN}
	install -m 0644 ${S}/python-bindings/_pbindings.so ${D}${PYTHON_SITEPACKAGES_DIR}/${BPN}
}

PACKAGES =+ "${PN}-python"

FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
