BRANCH ?= "release-2020.2.2_k26"
SRC_URI = "git://github.com/Xilinx/ap1302-firmware.git;protocol=https;branch=${BRANCH}"
SRCREV ?= "fe5728ca83f305b186a2a136a7e9e5ecd7f672ce"

S = "${WORKDIR}/git"

FW_NAME ?= ""

do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install() {
	install -d ${D}/lib/firmware
	install -m 0644 ${FW_NAME} ${D}/lib/firmware/${FW_NAME}
}

FILES_${PN} = "/lib/firmware/${FW_NAME}"
