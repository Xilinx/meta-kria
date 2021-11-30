LICENSE = "Proprietary"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9c13aad1aab42f76326f1beceafc40c4"

BRANCH ?= "xlnx_rel_v2021.2"
SRC_URI = "git://github.com/Xilinx/ap1302-firmware.git;protocol=https;branch=${BRANCH}"
SRCREV ?= "b8ed4768b728215e9ae0ed0d12e9ba86d79ba87e"

S = "${WORKDIR}/git"

FW_NAME ?= ""

do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install() {
	install -d ${D}/lib/firmware
	install -m 0644 ${FW_NAME} ${D}/lib/firmware/${FW_NAME}
}

FILES:${PN} = "/lib/firmware/${FW_NAME}"
