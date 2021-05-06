DESCRIPTION = "xmutil"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${S}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

RDEPENDS_${PN} = "python3-core fru-print dfx-mgr platformstats axi-qos ddr-qos image-update som-pwrctl"
inherit python3-dir
require xmutil.inc


BRANCHARG = "${@['nobranch=1', 'branch=${BRANCH}'][d.getVar('BRANCH', True) != '']}"
S = "${WORKDIR}/git"

SRC_URI="${REPO};${BRANCHARG}"

do_install() {
    install -d ${D}${bindir}/
    install -m 0755 ${S}/xmutil ${D}${bindir}/
}

FILES_${PN} += "${bindir}/xmutil"
