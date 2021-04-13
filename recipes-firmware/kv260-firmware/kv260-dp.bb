SUMMARY = "Firmware for the kv260 DP"

inherit fpgamanager_custom
include kv260-firmware.inc

FW_DIR = "dp"

do_install_append() {
	install -d ${D}${sysconfdir}/dfx-mgrd
	echo "${PN}" > ${D}${sysconfdir}/dfx-mgrd/${PN}
}

FILES_${PN} += "${sysconfdir}/dfx-mgrd/${PN}"

# Override the default package arch inherited from kv260-firmware.inc which
# is k26-kv. In order to add this package into the starter rootfs, the arch
# is changed to k26 instead. Do this only for this package as kv260-dp will
# be used as the default firmware to be loaded by dfx-mgrd during init.
COMPATIBLE_MACHINE_k26 = "${MACHINE}"
PACKAGE_ARCH = "${BOARD_ARCH}"

ALTERNATIVE_${PN} = "default_firmware"
ALTERNATIVE_TARGET[default_firmware] = "${sysconfdir}/dfx-mgrd/${PN}"
ALTERNATIVE_LINK_NAME[default_firmware] = "${sysconfdir}/dfx-mgrd/default_firmware"
