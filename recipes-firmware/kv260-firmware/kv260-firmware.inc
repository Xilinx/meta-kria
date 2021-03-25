BRANCH = "2020.2.2"
SRC_URI = "git://github.com/Xilinx/kv260-firmware.git;protocol=https;branch=${BRANCH}"
SRCREV = "23ad59b2eae40b6adfdf68170dc2332338585fbd"

VAI_DIR = "/opt/xilinx/share/vitis_ai_library/models"

inherit update-alternatives

do_install_append() {
	if [ -d ${S}/models ]; then
		install -d ${D}/${VAI_DIR}/${PN}
		cp -r ${S}/models/* ${D}/${VAI_DIR}/${PN}
	fi

	install -d ${D}${sysconfdir}/dfx-mgrd
	echo "${PN}" > ${D}${sysconfdir}/dfx-mgrd/${PN}
}

FILES_${PN} += "${sysconfdir}/dfx-mgrd/${PN}"

FILES_${PN}-models += "${VAI_DIR}"
PACKAGES += "${PN}-models"

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE_k26-kv = "${MACHINE}"
PACKAGE_ARCH = "${BOARDVARIANT_ARCH}"

ALTERNATIVE_${PN} = "default_firmware"
ALTERNATIVE_TARGET[default_firmware] = "${sysconfdir}/dfx-mgrd/${PN}"
ALTERNATIVE_LINK_NAME[default_firmware] = "${sysconfdir}/dfx-mgrd/default_firmware"
