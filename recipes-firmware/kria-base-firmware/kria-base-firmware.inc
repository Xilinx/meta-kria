LICENSE = "Proprietary & GPL-2.0"
LIC_FILES_CHKSUM = " \
	file://${WORKDIR}/git/LICENSE-BINARIES;md5=8a790d52e47a385cf2aa2db97afcb586 \
	file://${WORKDIR}/git/LICENSE-GPLv2;md5=9afdcd1be3f71bd3791fa5961075d776 \
	"

BRANCH = "xlnx_rel_v2022.1"
SRC_URI = "git://github.com/Xilinx/kria-base-firmware.git;protocol=https;branch=${BRANCH}"
SRCREV = "1d0dde7d0f7f8fe8816a526876d978480458850b"

inherit fpgamanager_custom

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:k26 = "${MACHINE}"
PACKAGE_ARCH = "${MACHINE_ARCH}"
