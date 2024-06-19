LICENSE = "Proprietary & GPL-2.0-only"
LIC_FILES_CHKSUM = " \
	file://${WORKDIR}/git/LICENSE-BINARIES;md5=09db6fa082215924b1374f4f02a49f72 \
	file://${WORKDIR}/git/LICENSE-GPLv2;md5=9afdcd1be3f71bd3791fa5961075d776 \
	"

BRANCH = "xlnx_rel_v2023.1"
SRC_URI = "git://github.com/Xilinx/kria-base-firmware.git;protocol=https;branch=${BRANCH}"
SRCREV = "d512881ad56fcb8ad3bffea543280c5b357bb9ea"

COMPATIBLE_MACHINE:kria-zynqmp-generic = "${MACHINE}"

inherit dfx_user_dts

do_install:append() {
	install -d ${D}${sysconfdir}/dfx-mgrd
	echo "${PN}" > ${D}${sysconfdir}/dfx-mgrd/${PN}
}

FILES:${PN} += "${sysconfdir}"

ALTERNATIVE:${PN} = "default_firmware"
ALTERNATIVE_TARGET[default_firmware] = "${sysconfdir}/dfx-mgrd/${PN}"
ALTERNATIVE_LINK_NAME[default_firmware] = "${sysconfdir}/dfx-mgrd/default_firmware"
