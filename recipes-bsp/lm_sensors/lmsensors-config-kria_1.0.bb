SUMMARY = "Kria specific lmsensors configuration files"
DESCRIPTION = "Kria-specific configuration files for lm-sensors that \
name and scale the on-board hardware-monitoring sensors exposed by the \
K24/K26 SOM."
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://fancontrol"

do_install() {
    install -D -m 0644 ${WORKDIR}/fancontrol ${D}${sysconfdir}/fancontrol
}

PACKAGE_ARCH = "${MACHINE_ARCH}"

PACKAGES =+ "${PN}-fancontrol"

FILES:${PN}-fancontrol = "${sysconfdir}/fancontrol"

RDEPENDS:${PN}-fancontrol = "lmsensors-fancontrol"
RDEPENDS:${PN}-dev = ""
