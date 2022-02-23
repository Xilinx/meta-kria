SUMMARY = "Xilinx platformstats library"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=616cf8b6d1f4be98265ef661616934d0"

BRANCH ?= "master"
SRC_URI = "git://github.com/Xilinx/platformstats.git;protocol=https;branch=${BRANCH}"
SRCREV ?= "032c597863429f97e02bf53decb231d0165e0d94"

PARALLEL_MAKE = "-j 1"

S="${WORKDIR}/git"

TARGET_CFLAGS = ""

do_compile(){
	cd ${S}/src
	oe_runmake

	cd ${S}/app
	oe_runmake
}

INSANE_SKIP:${PN} += "ldflags dev-so"

do_install(){
	install -d ${D}/usr/lib/platformstats
	install -d ${D}/usr/bin

	cp -r ${S}/src/*.so* ${D}/usr/lib
	cp -r ${S}/app/platformstats ${D}/usr/bin/platformstats
}

FILES:${PN} += " \
	/usr/bin \
	/usr/lib \
"
