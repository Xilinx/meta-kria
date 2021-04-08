BRANCH = "2020.2.2"
SRC_URI = "git://github.com/Xilinx/kv260-firmware.git;protocol=https;branch=${BRANCH}"
SRCREV = "0196281a6ea71875853016cd67cc67f5f1f199d4"

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
