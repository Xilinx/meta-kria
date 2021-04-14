LICENSE = "Proprietary & GPL-2.0"
LIC_FILES_CHKSUM = " \
	file://${WORKDIR}/git/LICENSE-BINARIES;md5=8a790d52e47a385cf2aa2db97afcb586 \
	file://${WORKDIR}/git/LICENSE-GPLv2;md5=9afdcd1be3f71bd3791fa5961075d776 \
	"

BRANCH = "release-2020.2.2_k26"
SRC_URI = "git://github.com/Xilinx/kv260-firmware.git;protocol=https;branch=${BRANCH}"
SRCREV = "3ee24b1500e40377c83e6c35f001b52de2ef8d8c"

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
