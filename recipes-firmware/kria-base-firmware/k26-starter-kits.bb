SUMMARY = "Base firmware for the k26 starter kits"

include kria-base-firmware.inc
inherit update-alternatives

FW_DIR = "k26_starter_kits"

do_install:append() {
	install -d ${D}${sysconfdir}/dfx-mgrd
	echo "${PN}" > ${D}${sysconfdir}/dfx-mgrd/${PN}
}

FILES:${PN} += "${sysconfdir}"

ALTERNATIVE:${PN} = "default_firmware"
ALTERNATIVE_TARGET[default_firmware] = "${sysconfdir}/dfx-mgrd/${PN}"
ALTERNATIVE_LINK_NAME[default_firmware] = "${sysconfdir}/dfx-mgrd/default_firmware"
