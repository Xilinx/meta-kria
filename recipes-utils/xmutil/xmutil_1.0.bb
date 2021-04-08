DESCRIPTION = "xmutil"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${S}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

RDEPENDS_${PN} = "python3-core fru-print dfx-mgr platformstats axi-qos ddr-qos image-update som-pwrctl"
inherit python3-dir

S = "${WORKDIR}/git"

SRC_URI += " \
    git://github.com/Xilinx/xmutil.git;branch=master;protocol=https \
    "
SRCREV="532ab4b1e8285d0b6c43b47b0c62e66792f0a065"

do_install() {
    install -d ${D}${bindir}/
    install -m 0755 ${S}/xmutil ${D}${bindir}/
}

FILES_${PN} += "${bindir}/xmutil"
