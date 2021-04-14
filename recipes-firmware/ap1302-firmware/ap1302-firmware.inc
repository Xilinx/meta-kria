SRC_URI = "http://petalinux.xilinx.com/sswreleases/rel-v2020.2.2/source-tarballs/ap1302-firmware.tar.gz"
SRC_URI[md5sum] = "b0d3ea0ad81f904f10806a1c8a68c6ee"

S = "${WORKDIR}/ap1302-firmware"

FW_NAME ?= ""

do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install() {
	install -d ${D}/lib/firmware
	install -m 0644 ${S}/${FW_NAME} ${D}/lib/firmware/${FW_NAME}
}

FILES_${PN} = "/lib/firmware/${FW_NAME}"
