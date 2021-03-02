DESCRIPTION = "Utility for PL power control of som"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${S}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

RDEPENDS_${PN} = "python3-core i2c-tools"
inherit python3-dir

S = "${WORKDIR}/git"

SRC_URI += " \
    git://github.com/Xilinx/xmutil.git;branch=master;protocol=https \
    "
SRCREV = "0a181b79543645534d751c768eda2f83a6b9bc77"

do_install() {
    install -d ${D}${bindir}/
    install -m 0755 ${S}/som-pwrctl ${D}${bindir}/
}
