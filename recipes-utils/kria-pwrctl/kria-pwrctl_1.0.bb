DESCRIPTION = "Utility for PL power control of Kria SOM"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${S}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

RDEPENDS:${PN} = "python3-core i2c-tools"
inherit python3-dir
require recipes-utils/xmutil/xmutil-1.0.inc

S = "${WORKDIR}/git"

BRANCHARG = "${@['nobranch=1', 'branch=${BRANCH}'][d.getVar('BRANCH', True) != '']}"
SRC_URI="${REPO};${BRANCHARG}"

do_install() {
    install -d ${D}${bindir}/
    install -m 0755 ${S}/som-pwrctl ${D}${bindir}/
    ln -s som-pwrctl ${D}${bindir}/kria-pwrctl
}
