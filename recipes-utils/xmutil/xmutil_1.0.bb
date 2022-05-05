DESCRIPTION = "xmutil"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${S}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

RDEPENDS:${PN} = "python3-core python3-distro fru-print dfx-mgr platformstats axi-qos ddr-qos image-update som-pwrctl"
inherit python3-dir
require xmutil.inc

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:zynqmp = "zynqmp"
COMPATIBLE_MACHINE:versal = "versal"

BRANCHARG = "${@['nobranch=1', 'branch=${BRANCH}'][d.getVar('BRANCH', True) != '']}"
S = "${WORKDIR}/git"

SRC_URI="${REPO};${BRANCHARG}"

do_install() {
    install -d ${D}${bindir}/
    install -m 0755 ${S}/xmutil ${D}${bindir}/
}

FILES:${PN} += "${bindir}/xmutil"
