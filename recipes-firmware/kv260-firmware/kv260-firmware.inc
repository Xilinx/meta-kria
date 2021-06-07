LICENSE = "Proprietary & GPL-2.0"
LIC_FILES_CHKSUM = " \
	file://${WORKDIR}/git/LICENSE-BINARIES;md5=8a790d52e47a385cf2aa2db97afcb586 \
	file://${WORKDIR}/git/LICENSE-GPLv2;md5=9afdcd1be3f71bd3791fa5961075d776 \
	"

BRANCH = "xlnx_rel_v2021.1"
SRC_URI = "git://github.com/Xilinx/kv260-firmware.git;protocol=https;branch=${BRANCH}"
SRCREV = "c6ece518e0269207d18541f4f7d8214c793f951d"

VAI_DIR = "/opt/xilinx/share/vitis_ai_library/models"

inherit update-alternatives

do_install_append() {
	if [ -d ${S}/models ]; then
		install -d ${D}/${VAI_DIR}/${PN}
		cp -r ${S}/models/* ${D}/${VAI_DIR}/${PN}
	fi
}

FILES_${PN}-models += "${VAI_DIR}"
PACKAGES += "${PN}-models"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE_k26-kv = "${MACHINE}"
PACKAGE_ARCH = "${BOARDVARIANT_ARCH}"
